[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.devices](package-summary.html)
2. [DeviceData](DeviceData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [deviceSpeakerSoundMod](#deviceSpeakerSoundMod)
   2. [deviceButtonSoundVol](#deviceButtonSoundVol)
   3. [deviceName](#deviceName)
   4. [twoWay](#twoWay)
   5. [transmitRange](#transmitRange)
   6. [micRange](#micRange)
   7. [micIsMuted](#micIsMuted)
   8. [baseVolumeRange](#baseVolumeRange)
   9. [deviceVolume](#deviceVolume)
   10. [isPortable](#isPortable)
   11. [isTelevision](#isTelevision)
   12. [isHighTier](#isHighTier)
   13. [isTurnedOn](#isTurnedOn)
   14. [channel](#channel)
   15. [minChannelRange](#minChannelRange)
   16. [maxChannelRange](#maxChannelRange)
   17. [presets](#presets)
   18. [isBatteryPowered](#isBatteryPowered)
   19. [hasBattery](#hasBattery)
   20. [powerDelta](#powerDelta)
   21. [useDelta](#useDelta)
   22. [lastRecordedDistance](#lastRecordedDistance)
   23. [headphoneType](#headphoneType)
   24. [parent](#parent)
   25. [gameTime](#gameTime)
   26. [channelChangedRecently](#channelChangedRecently)
   27. [emitter](#emitter)
   28. [parameterList](#parameterList)
   29. [parameterDeviceVolume](#parameterDeviceVolume)
   30. [mediaIndex](#mediaIndex)
   31. [mediaType](#mediaType)
   32. [mediaItem](#mediaItem)
   33. [playingMedia](#playingMedia)
   34. [isPlayingMedia](#isPlayingMedia)
   35. [mediaLineIndex](#mediaLineIndex)
   36. [lineCounter](#lineCounter)
   37. [currentMediaLine](#currentMediaLine)
   38. [currentMediaColor](#currentMediaColor)
   39. [isStoppingMedia](#isStoppingMedia)
   40. [stopMediaCounter](#stopMediaCounter)
   41. [noTransmit](#noTransmit)
   42. [soundCounterStatic](#soundCounterStatic)
   43. [radioLoopSound](#radioLoopSound)
   44. [doTriggerWorldSound](#doTriggerWorldSound)
   45. [lastMinuteStamp](#lastMinuteStamp)
   46. [listenCnt](#listenCnt)
   47. [nextStaticSound](#nextStaticSound)
   48. [voipCounter](#voipCounter)
   49. [signalCounter](#signalCounter)
   50. [soundCounter](#soundCounter)
   51. [minmod](#minmod)
   52. [maxmod](#maxmod)
6. [Constructor Details](#constructor-detail)
   1. [DeviceData()](#%3Cinit%3E())
   2. [DeviceData(WaveSignalDevice)](#%3Cinit%3E(zombie.radio.devices.WaveSignalDevice))
7. [Method Details](#method-detail)
   1. [generatePresets()](#generatePresets())
   2. [clone()](#clone())
   3. [getClone()](#getClone())
   4. [getParent()](#getParent())
   5. [setParent(WaveSignalDevice)](#setParent(zombie.radio.devices.WaveSignalDevice))
   6. [getDevicePresets()](#getDevicePresets())
   7. [setDevicePresets(DevicePresets)](#setDevicePresets(zombie.radio.devices.DevicePresets))
   8. [cloneDevicePresets(DevicePresets)](#cloneDevicePresets(zombie.radio.devices.DevicePresets))
   9. [getMinChannelRange()](#getMinChannelRange())
   10. [setMinChannelRange(int)](#setMinChannelRange(int))
   11. [getMaxChannelRange()](#getMaxChannelRange())
   12. [setMaxChannelRange(int)](#setMaxChannelRange(int))
   13. [getIsHighTier()](#getIsHighTier())
   14. [setIsHighTier(boolean)](#setIsHighTier(boolean))
   15. [getIsBatteryPowered()](#getIsBatteryPowered())
   16. [setIsBatteryPowered(boolean)](#setIsBatteryPowered(boolean))
   17. [getHasBattery()](#getHasBattery())
   18. [setHasBattery(boolean)](#setHasBattery(boolean))
   19. [addBattery(DrainableComboItem)](#addBattery(zombie.inventory.types.DrainableComboItem))
   20. [getBattery(ItemContainer)](#getBattery(zombie.inventory.ItemContainer))
   21. [transmitBatteryChange()](#transmitBatteryChange())
   22. [transmitBatteryChangeServer()](#transmitBatteryChangeServer())
   23. [addHeadphones(InventoryItem)](#addHeadphones(zombie.inventory.InventoryItem))
   24. [getHeadphones(ItemContainer)](#getHeadphones(zombie.inventory.ItemContainer))
   25. [getMicRange()](#getMicRange())
   26. [setMicRange(int)](#setMicRange(int))
   27. [getMicIsMuted()](#getMicIsMuted())
   28. [setMicIsMuted(boolean)](#setMicIsMuted(boolean))
   29. [getHeadphoneType()](#getHeadphoneType())
   30. [setHeadphoneType(int)](#setHeadphoneType(int))
   31. [getBaseVolumeRange()](#getBaseVolumeRange())
   32. [setBaseVolumeRange(float)](#setBaseVolumeRange(float))
   33. [getDeviceVolume()](#getDeviceVolume())
   34. [setDeviceVolume(float)](#setDeviceVolume(float))
   35. [setDeviceVolumeRaw(float)](#setDeviceVolumeRaw(float))
   36. [getIsTelevision()](#getIsTelevision())
   37. [isTelevision()](#isTelevision())
   38. [setIsTelevision(boolean)](#setIsTelevision(boolean))
   39. [canPlayerRemoteInteract(IsoGameCharacter)](#canPlayerRemoteInteract(zombie.characters.IsoGameCharacter))
   40. [getDeviceName()](#getDeviceName())
   41. [setDeviceName(String)](#setDeviceName(java.lang.String))
   42. [getIsTwoWay()](#getIsTwoWay())
   43. [setIsTwoWay(boolean)](#setIsTwoWay(boolean))
   44. [getTransmitRange()](#getTransmitRange())
   45. [setTransmitRange(int)](#setTransmitRange(int))
   46. [getIsPortable()](#getIsPortable())
   47. [setIsPortable(boolean)](#setIsPortable(boolean))
   48. [getIsTurnedOn()](#getIsTurnedOn())
   49. [setIsTurnedOn(boolean)](#setIsTurnedOn(boolean))
   50. [setIsTurnedOnInternal(boolean)](#setIsTurnedOnInternal(boolean))
   51. [setTurnedOnRaw(boolean)](#setTurnedOnRaw(boolean))
   52. [canBePoweredHere()](#canBePoweredHere())
   53. [setRandomChannel()](#setRandomChannel())
   54. [getChannel()](#getChannel())
   55. [setChannel(int)](#setChannel(int))
   56. [setChannel(int, boolean)](#setChannel(int,boolean))
   57. [setChannelRaw(int)](#setChannelRaw(int))
   58. [getUseDelta()](#getUseDelta())
   59. [setUseDelta(float)](#setUseDelta(float))
   60. [getPower()](#getPower())
   61. [setPower(float)](#setPower(float))
   62. [setInitialPower()](#setInitialPower())
   63. [TriggerPlayerListening(boolean)](#TriggerPlayerListening(boolean))
   64. [playSoundSend(String, boolean)](#playSoundSend(java.lang.String,boolean))
   65. [playSoundLocal(String, boolean)](#playSoundLocal(java.lang.String,boolean))
   66. [playSound(String, float, boolean)](#playSound(java.lang.String,float,boolean))
   67. [setSoundVolume(long, float)](#setSoundVolume(long,float))
   68. [stopOrTriggerSoundByName(String)](#stopOrTriggerSoundByName(java.lang.String))
   69. [cleanSoundsAndEmitter()](#cleanSoundsAndEmitter())
   70. [getIsoObject()](#getIsoObject())
   71. [setEmitterAndPos()](#setEmitterAndPos())
   72. [updateEmitter()](#updateEmitter())
   73. [getEmitter()](#getEmitter())
   74. [update(boolean, boolean)](#update(boolean,boolean))
   75. [updateSimple()](#updateSimple())
   76. [updateStaticSounds()](#updateStaticSounds())
   77. [setNextStaticSound()](#setNextStaticSound())
   78. [getDeviceVolumeRange()](#getDeviceVolumeRange())
   79. [getDeviceSoundVolumeRange()](#getDeviceSoundVolumeRange())
   80. [doReceiveSignal(int)](#doReceiveSignal(int))
   81. [doReceiveMPSignal(float)](#doReceiveMPSignal(float))
   82. [isReceivingSignal()](#isReceivingSignal())
   83. [getLastRecordedDistance()](#getLastRecordedDistance())
   84. [isIsoDevice()](#isIsoDevice())
   85. [isInventoryDevice()](#isInventoryDevice())
   86. [isVehicleDevice()](#isVehicleDevice())
   87. [transmitPresets()](#transmitPresets())
   88. [transmitDeviceDataState(short)](#transmitDeviceDataState(short))
   89. [transmitDeviceDataStateServer(short, UdpConnection)](#transmitDeviceDataStateServer(short,zombie.core.raknet.UdpConnection))
   90. [sendDeviceDataStatePacket(UdpConnection, short)](#sendDeviceDataStatePacket(zombie.core.raknet.UdpConnection,short))
   91. [receiveDeviceDataStatePacket(ByteBufferReader, UdpConnection)](#receiveDeviceDataStatePacket(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   92. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   93. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   94. [hasMedia()](#hasMedia())
   95. [getMediaIndex()](#getMediaIndex())
   96. [setMediaIndex(short)](#setMediaIndex(short))
   97. [getMediaType()](#getMediaType())
   98. [setMediaType(byte)](#setMediaType(byte))
   99. [addMediaItem(InventoryItem)](#addMediaItem(zombie.inventory.InventoryItem))
   100. [removeMediaItem(ItemContainer)](#removeMediaItem(zombie.inventory.ItemContainer))
   101. [isPlayingMedia()](#isPlayingMedia())
   102. [StartPlayMedia()](#StartPlayMedia())
   103. [prePlayingMedia()](#prePlayingMedia())
   104. [postPlayingMedia()](#postPlayingMedia())
   105. [televisionMediaSwitch()](#televisionMediaSwitch())
   106. [StopPlayMedia()](#StopPlayMedia())
   107. [updateMediaPlaying()](#updateMediaPlaying())
   108. [getMediaData()](#getMediaData())
   109. [isNoTransmit()](#isNoTransmit())
   110. [setNoTransmit(boolean)](#setNoTransmit(boolean))
   111. [isEmergencyBroadcast()](#isEmergencyBroadcast())
   112. [getFMODParameters()](#getFMODParameters())
   113. [startEvent(long, GameSoundClip, boolean, BitSet)](#startEvent(long,zombie.audio.GameSoundClip,boolean,java.util.BitSet))
   114. [updateEvent(long, GameSoundClip)](#updateEvent(long,zombie.audio.GameSoundClip))
   115. [stopEvent(long, GameSoundClip, boolean, BitSet)](#stopEvent(long,zombie.audio.GameSoundClip,boolean,java.util.BitSet))
   116. [addEmergencyChannel()](#addEmergencyChannel())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class DeviceData
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.devices.DeviceData

All Implemented Interfaces:
:   `fmod.fmod.IFMODParameterUpdater, Cloneable`

---

public final class DeviceData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Cloneable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Cloneable.html "class or interface in java.lang"), fmod.fmod.IFMODParameterUpdater

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected float`

  `baseVolumeRange`

  `protected int`

  `channel`

  `protected boolean`

  `channelChangedRecently`

  `protected Color`

  `currentMediaColor`

  `protected String`

  `currentMediaLine`

  `private static final float`

  `deviceButtonSoundVol`

  `protected String`

  `deviceName`

  `private static final float`

  `deviceSpeakerSoundMod`

  `protected float`

  `deviceVolume`

  `protected boolean`

  `doTriggerWorldSound`

  `protected BaseSoundEmitter`

  `emitter`

  `protected GameTime`

  `gameTime`

  `protected boolean`

  `hasBattery`

  `protected int`

  `headphoneType`

  `protected boolean`

  `isBatteryPowered`

  `protected boolean`

  `isHighTier`

  `protected boolean`

  `isPlayingMedia`

  `protected boolean`

  `isPortable`

  `protected boolean`

  `isStoppingMedia`

  `protected boolean`

  `isTelevision`

  `protected boolean`

  `isTurnedOn`

  `protected long`

  `lastMinuteStamp`

  `protected int`

  `lastRecordedDistance`

  `protected float`

  `lineCounter`

  `protected int`

  `listenCnt`

  `protected int`

  `maxChannelRange`

  `(package private) float`

  `maxmod`

  `protected short`

  `mediaIndex`

  `protected String`

  `mediaItem`

  `protected int`

  `mediaLineIndex`

  `protected byte`

  `mediaType`

  `protected boolean`

  `micIsMuted`

  `protected int`

  `micRange`

  `protected int`

  `minChannelRange`

  `(package private) float`

  `minmod`

  `(package private) float`

  `nextStaticSound`

  `protected boolean`

  `noTransmit`

  `protected zombie.audio.parameters.ParameterDeviceVolume`

  `parameterDeviceVolume`

  `protected zombie.audio.FMODParameterList`

  `parameterList`

  `protected WaveSignalDevice`

  `parent`

  `protected MediaData`

  `playingMedia`

  `protected float`

  `powerDelta`

  `protected DevicePresets`

  `presets`

  `protected long`

  `radioLoopSound`

  `protected float`

  `signalCounter`

  `protected float`

  `soundCounter`

  `private final float`

  `soundCounterStatic`

  `protected float`

  `stopMediaCounter`

  `protected int`

  `transmitRange`

  `protected boolean`

  `twoWay`

  `protected float`

  `useDelta`

  `protected float`

  `voipCounter`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DeviceData()`

  `DeviceData(WaveSignalDevice parent)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addBattery(DrainableComboItem bat)`

  `void`

  `addEmergencyChannel()`

  `void`

  `addHeadphones(InventoryItem headphones)`

  `void`

  `addMediaItem(InventoryItem media)`

  `boolean`

  `canBePoweredHere()`

  `boolean`

  `canPlayerRemoteInteract(IsoGameCharacter character)`

  `void`

  `cleanSoundsAndEmitter()`

  `protected Object`

  `clone()`

  `void`

  `cloneDevicePresets(DevicePresets p)`

  `void`

  `doReceiveMPSignal(float distance)`

  `void`

  `doReceiveSignal(int distance)`

  `void`

  `generatePresets()`

  `float`

  `getBaseVolumeRange()`

  `void`

  `getBattery(ItemContainer inventory)`

  `int`

  `getChannel()`

  `DeviceData`

  `getClone()`

  `String`

  `getDeviceName()`

  `DevicePresets`

  `getDevicePresets()`

  `int`

  `getDeviceSoundVolumeRange()`

  `float`

  `getDeviceVolume()`

  `int`

  `getDeviceVolumeRange()`

  `BaseSoundEmitter`

  `getEmitter()`

  `zombie.audio.FMODParameterList`

  `getFMODParameters()`

  `boolean`

  `getHasBattery()`

  `InventoryItem`

  `getHeadphones(ItemContainer inventory)`

  `int`

  `getHeadphoneType()`

  `boolean`

  `getIsBatteryPowered()`

  `boolean`

  `getIsHighTier()`

  `IsoObject`

  `getIsoObject()`

  `boolean`

  `getIsPortable()`

  `boolean`

  `getIsTelevision()`

  `boolean`

  `getIsTurnedOn()`

  `boolean`

  `getIsTwoWay()`

  `int`

  `getLastRecordedDistance()`

  `int`

  `getMaxChannelRange()`

  `MediaData`

  `getMediaData()`

  `short`

  `getMediaIndex()`

  `byte`

  `getMediaType()`

  `boolean`

  `getMicIsMuted()`

  `int`

  `getMicRange()`

  `int`

  `getMinChannelRange()`

  `WaveSignalDevice`

  `getParent()`

  `float`

  `getPower()`

  `int`

  `getTransmitRange()`

  `float`

  `getUseDelta()`

  `boolean`

  `hasMedia()`

  `boolean`

  `isEmergencyBroadcast()`

  `boolean`

  `isInventoryDevice()`

  `boolean`

  `isIsoDevice()`

  `boolean`

  `isNoTransmit()`

  `boolean`

  `isPlayingMedia()`

  `boolean`

  `isReceivingSignal()`

  `boolean`

  `isTelevision()`

  `boolean`

  `isVehicleDevice()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean net)`

  `void`

  `playSound(String soundname,
  float volume,
  boolean transmit)`

  `void`

  `playSoundLocal(String soundname,
  boolean useDeviceVolume)`

  `void`

  `playSoundSend(String soundname,
  boolean useDeviceVolume)`

  `private void`

  `postPlayingMedia()`

  `private void`

  `prePlayingMedia()`

  `void`

  `receiveDeviceDataStatePacket(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection ignoreConnection)`

  `void`

  `removeMediaItem(ItemContainer inventory)`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `private void`

  `sendDeviceDataStatePacket(zombie.core.raknet.UdpConnection connection,
  short type)`

  `void`

  `setBaseVolumeRange(float f)`

  `void`

  `setChannel(int c)`

  `void`

  `setChannel(int chan,
  boolean setislistening)`

  `void`

  `setChannelRaw(int chan)`

  `void`

  `setDeviceName(String name)`

  `void`

  `setDevicePresets(DevicePresets p)`

  `void`

  `setDeviceVolume(float f)`

  `void`

  `setDeviceVolumeRaw(float f)`

  `protected void`

  `setEmitterAndPos()`

  `void`

  `setHasBattery(boolean b)`

  `void`

  `setHeadphoneType(int i)`

  `void`

  `setInitialPower()`

  `void`

  `setIsBatteryPowered(boolean b)`

  `void`

  `setIsHighTier(boolean b)`

  `void`

  `setIsPortable(boolean b)`

  `void`

  `setIsTelevision(boolean b)`

  `void`

  `setIsTurnedOn(boolean b)`

  `private void`

  `setIsTurnedOnInternal(boolean b)`

  `void`

  `setIsTwoWay(boolean b)`

  `void`

  `setMaxChannelRange(int i)`

  `void`

  `setMediaIndex(short mediaIndex)`

  `void`

  `setMediaType(byte mediaType)`

  `void`

  `setMicIsMuted(boolean b)`

  `void`

  `setMicRange(int i)`

  `void`

  `setMinChannelRange(int i)`

  `private void`

  `setNextStaticSound()`

  `void`

  `setNoTransmit(boolean noTransmit)`

  `void`

  `setParent(WaveSignalDevice p)`

  `void`

  `setPower(float p)`

  `void`

  `setRandomChannel()`

  `private void`

  `setSoundVolume(long eventInstance,
  float volume)`

  `void`

  `setTransmitRange(int range)`

  `void`

  `setTurnedOnRaw(boolean b)`

  `void`

  `setUseDelta(float f)`

  `void`

  `startEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote,
  BitSet parameterSet)`

  `void`

  `StartPlayMedia()`

  `void`

  `stopEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote,
  BitSet parameterSet)`

  `void`

  `stopOrTriggerSoundByName(String soundName)`

  `void`

  `StopPlayMedia()`

  `private void`

  `televisionMediaSwitch()`

  `void`

  `transmitBatteryChange()`

  `void`

  `transmitBatteryChangeServer()`

  `private void`

  `transmitDeviceDataState(short type)`

  `private void`

  `transmitDeviceDataStateServer(short type,
  zombie.core.raknet.UdpConnection ignoreConnection)`

  `void`

  `transmitPresets()`

  `void`

  `TriggerPlayerListening(boolean listening)`

  `void`

  `update(boolean isIso,
  boolean playerInRange)`

  `protected void`

  `updateEmitter()`

  `void`

  `updateEvent(long eventInstance,
  GameSoundClip clip)`

  `void`

  `updateMediaPlaying()`

  `void`

  `updateSimple()`

  `private void`

  `updateStaticSounds()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### deviceSpeakerSoundMod

    private static final float deviceSpeakerSoundMod

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.devices.DeviceData.deviceSpeakerSoundMod)
  + ### deviceButtonSoundVol

    private static final float deviceButtonSoundVol

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.devices.DeviceData.deviceButtonSoundVol)
  + ### deviceName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") deviceName
  + ### twoWay

    protected boolean twoWay
  + ### transmitRange

    protected int transmitRange
  + ### micRange

    protected int micRange
  + ### micIsMuted

    protected boolean micIsMuted
  + ### baseVolumeRange

    protected float baseVolumeRange
  + ### deviceVolume

    protected float deviceVolume
  + ### isPortable

    protected boolean isPortable
  + ### isTelevision

    protected boolean isTelevision
  + ### isHighTier

    protected boolean isHighTier
  + ### isTurnedOn

    protected boolean isTurnedOn
  + ### channel

    protected int channel
  + ### minChannelRange

    protected int minChannelRange
  + ### maxChannelRange

    protected int maxChannelRange
  + ### presets

    protected [DevicePresets](DevicePresets.html "class in zombie.radio.devices") presets
  + ### isBatteryPowered

    protected boolean isBatteryPowered
  + ### hasBattery

    protected boolean hasBattery
  + ### powerDelta

    protected float powerDelta
  + ### useDelta

    protected float useDelta
  + ### lastRecordedDistance

    protected int lastRecordedDistance
  + ### headphoneType

    protected int headphoneType
  + ### parent

    protected [WaveSignalDevice](WaveSignalDevice.html "interface in zombie.radio.devices") parent
  + ### gameTime

    protected [GameTime](../../GameTime.html "class in zombie") gameTime
  + ### channelChangedRecently

    protected boolean channelChangedRecently
  + ### emitter

    protected [BaseSoundEmitter](../../audio/BaseSoundEmitter.html "class in zombie.audio") emitter
  + ### parameterList

    protected zombie.audio.FMODParameterList parameterList
  + ### parameterDeviceVolume

    protected zombie.audio.parameters.ParameterDeviceVolume parameterDeviceVolume
  + ### mediaIndex

    protected short mediaIndex
  + ### mediaType

    protected byte mediaType
  + ### mediaItem

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mediaItem
  + ### playingMedia

    protected [MediaData](../media/MediaData.html "class in zombie.radio.media") playingMedia
  + ### isPlayingMedia

    protected boolean isPlayingMedia
  + ### mediaLineIndex

    protected int mediaLineIndex
  + ### lineCounter

    protected float lineCounter
  + ### currentMediaLine

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentMediaLine
  + ### currentMediaColor

    protected [Color](../../core/Color.html "class in zombie.core") currentMediaColor
  + ### isStoppingMedia

    protected boolean isStoppingMedia
  + ### stopMediaCounter

    protected float stopMediaCounter
  + ### noTransmit

    protected boolean noTransmit
  + ### soundCounterStatic

    private final float soundCounterStatic

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.devices.DeviceData.soundCounterStatic)
  + ### radioLoopSound

    protected long radioLoopSound
  + ### doTriggerWorldSound

    protected boolean doTriggerWorldSound
  + ### lastMinuteStamp

    protected long lastMinuteStamp
  + ### listenCnt

    protected int listenCnt
  + ### nextStaticSound

    float nextStaticSound
  + ### voipCounter

    protected float voipCounter
  + ### signalCounter

    protected float signalCounter
  + ### soundCounter

    protected float soundCounter
  + ### minmod

    float minmod
  + ### maxmod

    float maxmod
* Constructor Details
  -------------------

  + ### DeviceData

    public DeviceData()
  + ### DeviceData

    public DeviceData([WaveSignalDevice](WaveSignalDevice.html "interface in zombie.radio.devices") parent)
* Method Details
  --------------

  + ### generatePresets

    public void generatePresets()
  + ### clone

    protected [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") clone()
    throws [CloneNotSupportedException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/CloneNotSupportedException.html "class or interface in java.lang")

    Overrides:
    :   `clone` in class `Object`

    Throws:
    :   `CloneNotSupportedException`
  + ### getClone

    public [DeviceData](DeviceData.html "class in zombie.radio.devices") getClone()
  + ### getParent

    public [WaveSignalDevice](WaveSignalDevice.html "interface in zombie.radio.devices") getParent()
  + ### setParent

    public void setParent([WaveSignalDevice](WaveSignalDevice.html "interface in zombie.radio.devices") p)
  + ### getDevicePresets

    public [DevicePresets](DevicePresets.html "class in zombie.radio.devices") getDevicePresets()
  + ### setDevicePresets

    public void setDevicePresets([DevicePresets](DevicePresets.html "class in zombie.radio.devices") p)
  + ### cloneDevicePresets

    public void cloneDevicePresets([DevicePresets](DevicePresets.html "class in zombie.radio.devices") p)
    throws [CloneNotSupportedException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/CloneNotSupportedException.html "class or interface in java.lang")

    Throws:
    :   `CloneNotSupportedException`
  + ### getMinChannelRange

    public int getMinChannelRange()
  + ### setMinChannelRange

    public void setMinChannelRange(int i)
  + ### getMaxChannelRange

    public int getMaxChannelRange()
  + ### setMaxChannelRange

    public void setMaxChannelRange(int i)
  + ### getIsHighTier

    public boolean getIsHighTier()
  + ### setIsHighTier

    public void setIsHighTier(boolean b)
  + ### getIsBatteryPowered

    public boolean getIsBatteryPowered()
  + ### setIsBatteryPowered

    public void setIsBatteryPowered(boolean b)
  + ### getHasBattery

    public boolean getHasBattery()
  + ### setHasBattery

    public void setHasBattery(boolean b)
  + ### addBattery

    public void addBattery([DrainableComboItem](../../inventory/types/DrainableComboItem.html "class in zombie.inventory.types") bat)
  + ### getBattery

    public void getBattery([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") inventory)
  + ### transmitBatteryChange

    public void transmitBatteryChange()
  + ### transmitBatteryChangeServer

    public void transmitBatteryChangeServer()
  + ### addHeadphones

    public void addHeadphones([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") headphones)
  + ### getHeadphones

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getHeadphones([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") inventory)
  + ### getMicRange

    public int getMicRange()
  + ### setMicRange

    public void setMicRange(int i)
  + ### getMicIsMuted

    public boolean getMicIsMuted()
  + ### setMicIsMuted

    public void setMicIsMuted(boolean b)
  + ### getHeadphoneType

    public int getHeadphoneType()
  + ### setHeadphoneType

    public void setHeadphoneType(int i)
  + ### getBaseVolumeRange

    public float getBaseVolumeRange()
  + ### setBaseVolumeRange

    public void setBaseVolumeRange(float f)
  + ### getDeviceVolume

    public float getDeviceVolume()
  + ### setDeviceVolume

    public void setDeviceVolume(float f)
  + ### setDeviceVolumeRaw

    public void setDeviceVolumeRaw(float f)
  + ### getIsTelevision

    public boolean getIsTelevision()
  + ### isTelevision

    public boolean isTelevision()
  + ### setIsTelevision

    public void setIsTelevision(boolean b)
  + ### canPlayerRemoteInteract

    public boolean canPlayerRemoteInteract([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getDeviceName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDeviceName()
  + ### setDeviceName

    public void setDeviceName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getIsTwoWay

    public boolean getIsTwoWay()
  + ### setIsTwoWay

    public void setIsTwoWay(boolean b)
  + ### getTransmitRange

    public int getTransmitRange()
  + ### setTransmitRange

    public void setTransmitRange(int range)
  + ### getIsPortable

    public boolean getIsPortable()
  + ### setIsPortable

    public void setIsPortable(boolean b)
  + ### getIsTurnedOn

    public boolean getIsTurnedOn()
  + ### setIsTurnedOn

    public void setIsTurnedOn(boolean b)
  + ### setIsTurnedOnInternal

    private void setIsTurnedOnInternal(boolean b)
  + ### setTurnedOnRaw

    public void setTurnedOnRaw(boolean b)
  + ### canBePoweredHere

    public boolean canBePoweredHere()
  + ### setRandomChannel

    public void setRandomChannel()
  + ### getChannel

    public int getChannel()
  + ### setChannel

    public void setChannel(int c)
  + ### setChannel

    public void setChannel(int chan,
    boolean setislistening)
  + ### setChannelRaw

    public void setChannelRaw(int chan)
  + ### getUseDelta

    public float getUseDelta()
  + ### setUseDelta

    public void setUseDelta(float f)
  + ### getPower

    public float getPower()
  + ### setPower

    public void setPower(float p)
  + ### setInitialPower

    public void setInitialPower()
  + ### TriggerPlayerListening

    public void TriggerPlayerListening(boolean listening)
  + ### playSoundSend

    public void playSoundSend([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundname,
    boolean useDeviceVolume)
  + ### playSoundLocal

    public void playSoundLocal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundname,
    boolean useDeviceVolume)
  + ### playSound

    public void playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundname,
    float volume,
    boolean transmit)
  + ### setSoundVolume

    private void setSoundVolume(long eventInstance,
    float volume)
  + ### stopOrTriggerSoundByName

    public void stopOrTriggerSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName)
  + ### cleanSoundsAndEmitter

    public void cleanSoundsAndEmitter()
  + ### getIsoObject

    public [IsoObject](../../iso/IsoObject.html "class in zombie.iso") getIsoObject()
  + ### setEmitterAndPos

    protected void setEmitterAndPos()
  + ### updateEmitter

    protected void updateEmitter()
  + ### getEmitter

    public [BaseSoundEmitter](../../audio/BaseSoundEmitter.html "class in zombie.audio") getEmitter()
  + ### update

    public void update(boolean isIso,
    boolean playerInRange)
  + ### updateSimple

    public void updateSimple()
  + ### updateStaticSounds

    private void updateStaticSounds()
  + ### setNextStaticSound

    private void setNextStaticSound()
  + ### getDeviceVolumeRange

    public int getDeviceVolumeRange()
  + ### getDeviceSoundVolumeRange

    public int getDeviceSoundVolumeRange()
  + ### doReceiveSignal

    public void doReceiveSignal(int distance)
  + ### doReceiveMPSignal

    public void doReceiveMPSignal(float distance)
  + ### isReceivingSignal

    public boolean isReceivingSignal()
  + ### getLastRecordedDistance

    public int getLastRecordedDistance()
  + ### isIsoDevice

    public boolean isIsoDevice()
  + ### isInventoryDevice

    public boolean isInventoryDevice()
  + ### isVehicleDevice

    public boolean isVehicleDevice()
  + ### transmitPresets

    public void transmitPresets()
  + ### transmitDeviceDataState

    private void transmitDeviceDataState(short type)
  + ### transmitDeviceDataStateServer

    private void transmitDeviceDataStateServer(short type,
    zombie.core.raknet.UdpConnection ignoreConnection)
  + ### sendDeviceDataStatePacket

    private void sendDeviceDataStatePacket(zombie.core.raknet.UdpConnection connection,
    short type)
  + ### receiveDeviceDataStatePacket

    public void receiveDeviceDataStatePacket(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection ignoreConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### hasMedia

    public boolean hasMedia()
  + ### getMediaIndex

    public short getMediaIndex()
  + ### setMediaIndex

    public void setMediaIndex(short mediaIndex)
  + ### getMediaType

    public byte getMediaType()
  + ### setMediaType

    public void setMediaType(byte mediaType)
  + ### addMediaItem

    public void addMediaItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") media)
  + ### removeMediaItem

    public void removeMediaItem([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") inventory)
  + ### isPlayingMedia

    public boolean isPlayingMedia()
  + ### StartPlayMedia

    public void StartPlayMedia()
  + ### prePlayingMedia

    private void prePlayingMedia()
  + ### postPlayingMedia

    private void postPlayingMedia()
  + ### televisionMediaSwitch

    private void televisionMediaSwitch()
  + ### StopPlayMedia

    public void StopPlayMedia()
  + ### updateMediaPlaying

    public void updateMediaPlaying()
  + ### getMediaData

    public [MediaData](../media/MediaData.html "class in zombie.radio.media") getMediaData()
  + ### isNoTransmit

    public boolean isNoTransmit()
  + ### setNoTransmit

    public void setNoTransmit(boolean noTransmit)
  + ### isEmergencyBroadcast

    public boolean isEmergencyBroadcast()
  + ### getFMODParameters

    public zombie.audio.FMODParameterList getFMODParameters()

    Specified by:
    :   `getFMODParameters` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### startEvent

    public void startEvent(long eventInstance,
    [GameSoundClip](../../audio/GameSoundClip.html "class in zombie.audio") clip,
    boolean remote,
    [BitSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/BitSet.html "class or interface in java.util") parameterSet)

    Specified by:
    :   `startEvent` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### updateEvent

    public void updateEvent(long eventInstance,
    [GameSoundClip](../../audio/GameSoundClip.html "class in zombie.audio") clip)

    Specified by:
    :   `updateEvent` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### stopEvent

    public void stopEvent(long eventInstance,
    [GameSoundClip](../../audio/GameSoundClip.html "class in zombie.audio") clip,
    boolean remote,
    [BitSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/BitSet.html "class or interface in java.util") parameterSet)

    Specified by:
    :   `stopEvent` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### addEmergencyChannel

    public void addEmergencyChannel()