[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [VirtualVehicle](VirtualVehicle.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fakeChunk](#fakeChunk)
   2. [vehicle](#vehicle)
   3. [vehicleId](#vehicleId)
   4. [sqlId](#sqlId)
   5. [x](#x)
   6. [y](#y)
   7. [z](#z)
   8. [scriptName](#scriptName)
   9. [script](#script)
   10. [headlightsOn](#headlightsOn)
   11. [lightbarLightsMode](#lightbarLightsMode)
   12. [lightbarSirenMode](#lightbarSirenMode)
   13. [sirenStartTime](#sirenStartTime)
   14. [vehicleAlarm](#vehicleAlarm)
   15. [missingEnginePart](#missingEnginePart)
   16. [parts](#parts)
   17. [vehicleSounds](#vehicleSounds)
   18. [worldSoundUpdateLimit](#worldSoundUpdateLimit)
6. [Constructor Details](#constructor-detail)
   1. [VirtualVehicle()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getId()](#getId())
   2. [getSqlId()](#getSqlId())
   3. [getVehicleSounds()](#getVehicleSounds())
   4. [setNeedPartsUpdate(boolean)](#setNeedPartsUpdate(boolean))
   5. [set(BaseVehicle)](#set(zombie.vehicles.BaseVehicle))
   6. [update()](#update())
   7. [updateWorldSounds()](#updateWorldSounds())
   8. [shouldUpdateInMeta()](#shouldUpdateInMeta())
   9. [stopUpdatingInMeta()](#stopUpdatingInMeta())
   10. [removeFromMeta(BaseVehicle)](#removeFromMeta(zombie.vehicles.BaseVehicle))
   11. [save()](#save())
   12. [getX()](#getX())
   13. [getY()](#getY())
   14. [getZ()](#getZ())
   15. [getXi()](#getXi())
   16. [getYi()](#getYi())
   17. [getZi()](#getZi())
   18. [getSquare()](#getSquare())
   19. [getParts()](#getParts())
   20. [isListenerInRange(float)](#isListenerInRange(float))
   21. [getScriptName()](#getScriptName())
   22. [getScript()](#getScript())
   23. [getLightbarLightsModeObject()](#getLightbarLightsModeObject())
   24. [getHeadlightsOn()](#getHeadlightsOn())
   25. [getVehicleEngine()](#getVehicleEngine())
   26. [setEngineFeature(int, int, int)](#setEngineFeature(int,int,int))
   27. [isEngineWorking()](#isEngineWorking())
   28. [getBrakeSpeedBetweenUpdate()](#getBrakeSpeedBetweenUpdate())
   29. [setModelVisible(VehiclePart, VehicleScript.Model, boolean)](#setModelVisible(zombie.vehicles.VehiclePart,zombie.scripting.objects.VehicleScript.Model,boolean))
   30. [updateDamageOverlayLater()](#updateDamageOverlayLater())
   31. [updateTotalMass()](#updateTotalMass())
   32. [updateBulletStats()](#updateBulletStats())
   33. [updatePartStats()](#updatePartStats())
   34. [transmitEngine()](#transmitEngine())
   35. [transmitPartCondition(VehiclePart)](#transmitPartCondition(zombie.vehicles.VehiclePart))
   36. [transmitPartDoor(VehiclePart)](#transmitPartDoor(zombie.vehicles.VehiclePart))
   37. [transmitPartItem(VehiclePart)](#transmitPartItem(zombie.vehicles.VehiclePart))
   38. [transmitPartLight(VehiclePart)](#transmitPartLight(zombie.vehicles.VehiclePart))
   39. [transmitPartModData(VehiclePart)](#transmitPartModData(zombie.vehicles.VehiclePart))
   40. [transmitPartUsedDelta(VehiclePart)](#transmitPartUsedDelta(zombie.vehicles.VehiclePart))
   41. [transmitPartWindow(VehiclePart)](#transmitPartWindow(zombie.vehicles.VehiclePart))
   42. [getEngineCondition()](#getEngineCondition())
   43. [getEngineQuality()](#getEngineQuality())
   44. [getEngineState()](#getEngineState())
   45. [isEngineRunning()](#isEngineRunning())
   46. [isEngineSounding()](#isEngineSounding())
   47. [getEngineSpeed()](#getEngineSpeed())
   48. [getTransmissionNumber()](#getTransmissionNumber())
   49. [getCurrentSpeedKmHour()](#getCurrentSpeedKmHour())
   50. [getMaxSpeed()](#getMaxSpeed())
   51. [isAlarmActive()](#isAlarmActive())
   52. [isAlarmSoundOn()](#isAlarmSoundOn())
   53. [isAlarmSounding()](#isAlarmSounding())
   54. [isBrakePedalPressed()](#isBrakePedalPressed())
   55. [isGasPedalPressed()](#isGasPedalPressed())
   56. [getRoadMaterial()](#getRoadMaterial())
   57. [getChosenAlarmSound()](#getChosenAlarmSound())
   58. [isBackupBeeperSounding()](#isBackupBeeperSounding())
   59. [isDoorAlarmSounding()](#isDoorAlarmSounding())
   60. [isHornSounding()](#isHornSounding())
   61. [getVehicleSoundEmitter()](#getVehicleSoundEmitter())
   62. [isAnyListenerInside()](#isAnyListenerInside())
   63. [isSirenActive()](#isSirenActive())
   64. [isSirenSounding()](#isSirenSounding())
   65. [getSirenStartTime()](#getSirenStartTime())
   66. [setSirenStartTime(double)](#setSirenStartTime(double))
   67. [getLightbarSirenModeObject()](#getLightbarSirenModeObject())
   68. [setLightbarSirenMode(int)](#setLightbarSirenMode(int))
   69. [getMaxWheelSteering()](#getMaxWheelSteering())
   70. [getMinWheelSkid()](#getMinWheelSkid())
   71. [isAnyTireMissing()](#isAnyTireMissing())
   72. [onEngineStateChanged(BaseVehicle.engineStateTypes, BaseVehicle.engineStateTypes, VehicleEngineStateChangeReason)](#onEngineStateChanged(zombie.vehicles.BaseVehicle.engineStateTypes,zombie.vehicles.BaseVehicle.engineStateTypes,zombie.vehicles.VehicleEngineStateChangeReason))
   73. [onVehicleAlarmEvent(VehicleAlarmEvent)](#onVehicleAlarmEvent(zombie.vehicles.VehicleAlarmEvent))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class VirtualVehicle
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.VirtualVehicle

All Implemented Interfaces:
:   `zombie.vehicles.IVehicleAlarmListener, zombie.vehicles.IVehicleEngineListener, zombie.vehicles.VehiclePartOwner, zombie.vehicleSound.VehicleSoundOwner`

---

public final class VirtualVehicle
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.vehicles.VehiclePartOwner, zombie.vehicleSound.VehicleSoundOwner, zombie.vehicles.IVehicleAlarmListener

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static IsoChunk`

  `fakeChunk`

  `private boolean`

  `headlightsOn`

  `private zombie.vehicles.LightbarLightsMode`

  `lightbarLightsMode`

  `private zombie.vehicles.LightbarSirenMode`

  `lightbarSirenMode`

  `private VehiclePart`

  `missingEnginePart`

  `private VehicleParts`

  `parts`

  `private VehicleScript`

  `script`

  `private String`

  `scriptName`

  `(package private) double`

  `sirenStartTime`

  `private int`

  `sqlId`

  `private BaseVehicle`

  `vehicle`

  `private zombie.vehicles.VehicleAlarm`

  `vehicleAlarm`

  `private short`

  `vehicleId`

  `private zombie.vehicleSound.VehicleSounds`

  `vehicleSounds`

  `private final zombie.core.utils.UpdateLimit`

  `worldSoundUpdateLimit`

  `private float`

  `x`

  `private float`

  `y`

  `private float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VirtualVehicle()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getBrakeSpeedBetweenUpdate()`

  `String`

  `getChosenAlarmSound()`

  `float`

  `getCurrentSpeedKmHour()`

  `int`

  `getEngineCondition()`

  `int`

  `getEngineQuality()`

  `double`

  `getEngineSpeed()`

  `BaseVehicle.engineStateTypes`

  `getEngineState()`

  `boolean`

  `getHeadlightsOn()`

  `short`

  `getId()`

  `zombie.vehicles.LightbarLightsMode`

  `getLightbarLightsModeObject()`

  `zombie.vehicles.LightbarSirenMode`

  `getLightbarSirenModeObject()`

  `float`

  `getMaxSpeed()`

  `float`

  `getMaxWheelSteering()`

  `float`

  `getMinWheelSkid()`

  `VehicleParts`

  `getParts()`

  `zombie.audio.parameters.ParameterVehicleRoadMaterial.Material`

  `getRoadMaterial()`

  `VehicleScript`

  `getScript()`

  `String`

  `getScriptName()`

  `double`

  `getSirenStartTime()`

  `int`

  `getSqlId()`

  `IsoGridSquare`

  `getSquare()`

  `int`

  `getTransmissionNumber()`

  `private zombie.vehicles.VehicleEngine`

  `getVehicleEngine()`

  `BaseSoundEmitter`

  `getVehicleSoundEmitter()`

  `zombie.vehicleSound.VehicleSounds`

  `getVehicleSounds()`

  `float`

  `getX()`

  `int`

  `getXi()`

  `float`

  `getY()`

  `int`

  `getYi()`

  `float`

  `getZ()`

  `int`

  `getZi()`

  `boolean`

  `isAlarmActive()`

  `boolean`

  `isAlarmSounding()`

  `boolean`

  `isAlarmSoundOn()`

  `boolean`

  `isAnyListenerInside()`

  `boolean`

  `isAnyTireMissing()`

  `boolean`

  `isBackupBeeperSounding()`

  `boolean`

  `isBrakePedalPressed()`

  `boolean`

  `isDoorAlarmSounding()`

  `boolean`

  `isEngineRunning()`

  `boolean`

  `isEngineSounding()`

  `boolean`

  `isEngineWorking()`

  `boolean`

  `isGasPedalPressed()`

  `boolean`

  `isHornSounding()`

  `boolean`

  `isListenerInRange(float range)`

  `boolean`

  `isSirenActive()`

  `boolean`

  `isSirenSounding()`

  `void`

  `onEngineStateChanged(BaseVehicle.engineStateTypes oldState,
  BaseVehicle.engineStateTypes newState,
  zombie.vehicles.VehicleEngineStateChangeReason reason)`

  `void`

  `onVehicleAlarmEvent(zombie.vehicles.VehicleAlarmEvent event)`

  `void`

  `removeFromMeta(BaseVehicle vehicle)`

  `void`

  `save()`

  `void`

  `set(BaseVehicle vehicle)`

  `void`

  `setEngineFeature(int quality,
  int loudness,
  int engineForce)`

  `void`

  `setLightbarSirenMode(int mode)`

  `BaseVehicle.ModelInfo`

  `setModelVisible(VehiclePart part,
  VehicleScript.Model scriptModel,
  boolean visible)`

  `void`

  `setNeedPartsUpdate(boolean needPartsUpdate)`

  `void`

  `setSirenStartTime(double worldAgeHours)`

  `boolean`

  `shouldUpdateInMeta()`

  `void`

  `stopUpdatingInMeta()`

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

  `update()`

  `void`

  `updateBulletStats()`

  `void`

  `updateDamageOverlayLater()`

  `void`

  `updatePartStats()`

  `void`

  `updateTotalMass()`

  `private void`

  `updateWorldSounds()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.vehicles.VehiclePartOwner

  `getBattery, getBatteryCharge, getDriver, getDriverRegardlessOfTow, getEngine, getGasRemaining, getGasTank, getHeater, getLightbarLightsMode, getNumberOfPartsWithContainers, getPartById, getPartByIndex, getPartByPartId, getPartCount, getPartIndex, getTrailerTrunkPart, getTrunkDoorPart, getTrunkPart, setLightbarLightsMode, windowsOpen`

  ### Methods inherited from interface zombie.vehicleSound.VehicleSoundOwner

  `getLightbarSirenMode, hasAlarm, hasHorn, hasLightbar, hasSiren, sirenShutoffTimeExpired`

* Field Details
  -------------

  + ### fakeChunk

    private static [IsoChunk](../iso/IsoChunk.html "class in zombie.iso") fakeChunk
  + ### vehicle

    private [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicle
  + ### vehicleId

    private short vehicleId
  + ### sqlId

    private int sqlId
  + ### x

    private float x
  + ### y

    private float y
  + ### z

    private float z
  + ### scriptName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName
  + ### script

    private [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") script
  + ### headlightsOn

    private boolean headlightsOn
  + ### lightbarLightsMode

    private zombie.vehicles.LightbarLightsMode lightbarLightsMode
  + ### lightbarSirenMode

    private zombie.vehicles.LightbarSirenMode lightbarSirenMode
  + ### sirenStartTime

    double sirenStartTime
  + ### vehicleAlarm

    private zombie.vehicles.VehicleAlarm vehicleAlarm
  + ### missingEnginePart

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") missingEnginePart
  + ### parts

    private [VehicleParts](VehicleParts.html "class in zombie.vehicles") parts
  + ### vehicleSounds

    private zombie.vehicleSound.VehicleSounds vehicleSounds
  + ### worldSoundUpdateLimit

    private final zombie.core.utils.UpdateLimit worldSoundUpdateLimit
* Constructor Details
  -------------------

  + ### VirtualVehicle

    public VirtualVehicle()
* Method Details
  --------------

  + ### getId

    public short getId()
  + ### getSqlId

    public int getSqlId()
  + ### getVehicleSounds

    public zombie.vehicleSound.VehicleSounds getVehicleSounds()
  + ### setNeedPartsUpdate

    public void setNeedPartsUpdate(boolean needPartsUpdate)
  + ### set

    public void set([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### update

    public void update()
  + ### updateWorldSounds

    private void updateWorldSounds()
  + ### shouldUpdateInMeta

    public boolean shouldUpdateInMeta()
  + ### stopUpdatingInMeta

    public void stopUpdatingInMeta()
  + ### removeFromMeta

    public void removeFromMeta([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### save

    public void save()
  + ### getX

    public float getX()

    Specified by:
    :   `getX` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getX` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getY

    public float getY()

    Specified by:
    :   `getY` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getY` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getZ

    public float getZ()

    Specified by:
    :   `getZ` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getZ` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getXi

    public int getXi()

    Specified by:
    :   `getXi` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getXi` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getYi

    public int getYi()

    Specified by:
    :   `getYi` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getYi` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getZi

    public int getZi()

    Specified by:
    :   `getZi` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getZi` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getSquare

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquare()

    Specified by:
    :   `getSquare` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getParts

    public [VehicleParts](VehicleParts.html "class in zombie.vehicles") getParts()

    Specified by:
    :   `getParts` in interface `zombie.vehicles.VehiclePartOwner`
  + ### isListenerInRange

    public boolean isListenerInRange(float range)

    Specified by:
    :   `isListenerInRange` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getScriptName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getScriptName()

    Specified by:
    :   `getScriptName` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getScript

    public [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") getScript()

    Specified by:
    :   `getScript` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getScript` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getLightbarLightsModeObject

    public zombie.vehicles.LightbarLightsMode getLightbarLightsModeObject()

    Specified by:
    :   `getLightbarLightsModeObject` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getHeadlightsOn

    public boolean getHeadlightsOn()

    Specified by:
    :   `getHeadlightsOn` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getVehicleEngine

    private zombie.vehicles.VehicleEngine getVehicleEngine()
  + ### setEngineFeature

    public void setEngineFeature(int quality,
    int loudness,
    int engineForce)

    Specified by:
    :   `setEngineFeature` in interface `zombie.vehicles.VehiclePartOwner`
  + ### isEngineWorking

    public boolean isEngineWorking()

    Specified by:
    :   `isEngineWorking` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getBrakeSpeedBetweenUpdate

    public float getBrakeSpeedBetweenUpdate()

    Specified by:
    :   `getBrakeSpeedBetweenUpdate` in interface `zombie.vehicles.VehiclePartOwner`
  + ### setModelVisible

    public [BaseVehicle.ModelInfo](BaseVehicle.ModelInfo.html "class in zombie.vehicles") setModelVisible([VehiclePart](VehiclePart.html "class in zombie.vehicles") part,
    [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") scriptModel,
    boolean visible)

    Specified by:
    :   `setModelVisible` in interface `zombie.vehicles.VehiclePartOwner`
  + ### updateDamageOverlayLater

    public void updateDamageOverlayLater()

    Specified by:
    :   `updateDamageOverlayLater` in interface `zombie.vehicles.VehiclePartOwner`
  + ### updateTotalMass

    public void updateTotalMass()

    Specified by:
    :   `updateTotalMass` in interface `zombie.vehicles.VehiclePartOwner`
  + ### updateBulletStats

    public void updateBulletStats()

    Specified by:
    :   `updateBulletStats` in interface `zombie.vehicles.VehiclePartOwner`
  + ### updatePartStats

    public void updatePartStats()

    Specified by:
    :   `updatePartStats` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitEngine

    public void transmitEngine()

    Specified by:
    :   `transmitEngine` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitPartCondition

    public void transmitPartCondition([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartCondition` in interface `zombie.vehicles.VehiclePartOwner`
  + ### transmitPartDoor

    public void transmitPartDoor([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartDoor` in interface `zombie.vehicles.VehiclePartOwner`
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
  + ### transmitPartWindow

    public void transmitPartWindow([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)

    Specified by:
    :   `transmitPartWindow` in interface `zombie.vehicles.VehiclePartOwner`
  + ### getEngineCondition

    public int getEngineCondition()

    Specified by:
    :   `getEngineCondition` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getEngineQuality

    public int getEngineQuality()

    Specified by:
    :   `getEngineQuality` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getEngineState

    public [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") getEngineState()

    Specified by:
    :   `getEngineState` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isEngineRunning

    public boolean isEngineRunning()

    Specified by:
    :   `isEngineRunning` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isEngineSounding

    public boolean isEngineSounding()

    Specified by:
    :   `isEngineSounding` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getEngineSpeed

    public double getEngineSpeed()

    Specified by:
    :   `getEngineSpeed` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getTransmissionNumber

    public int getTransmissionNumber()

    Specified by:
    :   `getTransmissionNumber` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getCurrentSpeedKmHour

    public float getCurrentSpeedKmHour()

    Specified by:
    :   `getCurrentSpeedKmHour` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getMaxSpeed

    public float getMaxSpeed()

    Specified by:
    :   `getMaxSpeed` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isAlarmActive

    public boolean isAlarmActive()

    Specified by:
    :   `isAlarmActive` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### isAlarmSoundOn

    public boolean isAlarmSoundOn()

    Specified by:
    :   `isAlarmSoundOn` in interface `zombie.vehicleSound.VehicleSoundOwner`
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
  + ### getSirenStartTime

    public double getSirenStartTime()

    Specified by:
    :   `getSirenStartTime` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### setSirenStartTime

    public void setSirenStartTime(double worldAgeHours)

    Specified by:
    :   `setSirenStartTime` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### getLightbarSirenModeObject

    public zombie.vehicles.LightbarSirenMode getLightbarSirenModeObject()

    Specified by:
    :   `getLightbarSirenModeObject` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `getLightbarSirenModeObject` in interface `zombie.vehicleSound.VehicleSoundOwner`
  + ### setLightbarSirenMode

    public void setLightbarSirenMode(int mode)

    Specified by:
    :   `setLightbarSirenMode` in interface `zombie.vehicles.VehiclePartOwner`

    Specified by:
    :   `setLightbarSirenMode` in interface `zombie.vehicleSound.VehicleSoundOwner`
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
  + ### onEngineStateChanged

    public void onEngineStateChanged([BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") oldState,
    [BaseVehicle.engineStateTypes](BaseVehicle.engineStateTypes.html "enum class in zombie.vehicles") newState,
    zombie.vehicles.VehicleEngineStateChangeReason reason)

    Specified by:
    :   `onEngineStateChanged` in interface `zombie.vehicles.IVehicleEngineListener`
  + ### onVehicleAlarmEvent

    public void onVehicleAlarmEvent(zombie.vehicles.VehicleAlarmEvent event)

    Specified by:
    :   `onVehicleAlarmEvent` in interface `zombie.vehicles.IVehicleAlarmListener`