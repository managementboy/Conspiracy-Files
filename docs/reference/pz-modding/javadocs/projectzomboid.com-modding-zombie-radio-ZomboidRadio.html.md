[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.radio](package-summary.html)
2. [ZomboidRadio](ZomboidRadio.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [SAVE\_FILE](#SAVE_FILE)
   2. [devices](#devices)
   3. [broadcastDevices](#broadcastDevices)
   4. [scriptManager](#scriptManager)
   5. [daysSinceStart](#daysSinceStart)
   6. [lastRecordedHour](#lastRecordedHour)
   7. [playerLastLine](#playerLastLine)
   8. [channelNames](#channelNames)
   9. [categorizedChannels](#categorizedChannels)
   10. [knownFrequencies](#knownFrequencies)
   11. [debugConsole](#debugConsole)
   12. [hasRecievedServerData](#hasRecievedServerData)
   13. [storySoundManager](#storySoundManager)
   14. [staticSounds](#staticSounds)
   15. [DEBUG\_MODE](#DEBUG_MODE)
   16. [DEBUG\_XML](#DEBUG_XML)
   17. [DEBUG\_SOUND](#DEBUG_SOUND)
   18. [postRadioSilence](#postRadioSilence)
   19. [disableBroadcasting](#disableBroadcasting)
   20. [instance](#instance)
   21. [recordedMedia](#recordedMedia)
   22. [louisvilleObfuscation](#louisvilleObfuscation)
   23. [lastSaveFile](#lastSaveFile)
   24. [lastSaveContent](#lastSaveContent)
   25. [freqlist](#freqlist)
   26. [hasAppliedRangeDistortion](#hasAppliedRangeDistortion)
   27. [stringBuilder](#stringBuilder)
   28. [hasAppliedInterference](#hasAppliedInterference)
   29. [obfuscateChannels](#obfuscateChannels)
7. [Constructor Details](#constructor-detail)
   1. [ZomboidRadio()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [hasInstance()](#hasInstance())
   2. [getInstance()](#getInstance())
   3. [isStaticSound(String)](#isStaticSound(java.lang.String))
   4. [getScriptManager()](#getScriptManager())
   5. [getDaysSinceStart()](#getDaysSinceStart())
   6. [getDevices()](#getDevices())
   7. [getBroadcastDevices()](#getBroadcastDevices())
   8. [setHasRecievedServerData(boolean)](#setHasRecievedServerData(boolean))
   9. [addChannelName(String, int, String)](#addChannelName(java.lang.String,int,java.lang.String))
   10. [addChannelName(String, int, String, boolean)](#addChannelName(java.lang.String,int,java.lang.String,boolean))
   11. [removeChannelName(int)](#removeChannelName(int))
   12. [GetChannelList(String)](#GetChannelList(java.lang.String))
   13. [getChannelName(int)](#getChannelName(int))
   14. [getRandomFrequency()](#getRandomFrequency())
   15. [getRandomFrequency(int, int)](#getRandomFrequency(int,int))
   16. [getFullChannelList()](#getFullChannelList())
   17. [WriteRadioServerDataPacket(ByteBufferWriter)](#WriteRadioServerDataPacket(zombie.core.network.ByteBufferWriter))
   18. [Init(int)](#Init(int))
   19. [checkGameModeSpecificStart()](#checkGameModeSpecificStart())
   20. [Save()](#Save())
   21. [Load()](#Load())
   22. [Reset()](#Reset())
   23. [UpdateScripts(int, int)](#UpdateScripts(int,int))
   24. [render()](#render())
   25. [addFrequencyListEntry(boolean, DeviceData, int, int)](#addFrequencyListEntry(boolean,zombie.radio.devices.DeviceData,int,int))
   26. [update()](#update())
   27. [checkPlayerForDevice(IsoPlayer, IsoPlayer)](#checkPlayerForDevice(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer))
   28. [DeviceInRange(int, int, int, int, int)](#DeviceInRange(int,int,int,int,int))
   29. [GetDistance(int, int, int, int)](#GetDistance(int,int,int,int))
   30. [DistributeToPlayerOnClient(IsoPlayer, int, int, int, String, String, String, float, float, float, int, boolean)](#DistributeToPlayerOnClient(zombie.characters.IsoPlayer,int,int,int,java.lang.String,java.lang.String,java.lang.String,float,float,float,int,boolean))
   31. [DistributeToPlayer(IsoPlayer, int, int, int, String, String, String, float, float, float, int, boolean)](#DistributeToPlayer(zombie.characters.IsoPlayer,int,int,int,java.lang.String,java.lang.String,java.lang.String,float,float,float,int,boolean))
   32. [DistributeToPlayerInternal(WaveSignalDevice, IsoPlayer, int, int, String, String, String, float, float, float, int)](#DistributeToPlayerInternal(zombie.radio.devices.WaveSignalDevice,zombie.characters.IsoPlayer,int,int,java.lang.String,java.lang.String,java.lang.String,float,float,float,int))
   33. [DistributeTransmission(int, int, int, String, String, String, float, float, float, int, boolean)](#DistributeTransmission(int,int,int,java.lang.String,java.lang.String,java.lang.String,float,float,float,int,boolean))
   34. [doDeviceRangeDistortion(String, int, int)](#doDeviceRangeDistortion(java.lang.String,int,int))
   35. [getGameMode()](#getGameMode())
   36. [getRandomBzztFzzt()](#getRandomBzztFzzt())
   37. [applyWeatherInterference(String, int)](#applyWeatherInterference(java.lang.String,int))
   38. [scrambleString(String, int, boolean)](#scrambleString(java.lang.String,int,boolean))
   39. [scrambleString(String, int, boolean, String)](#scrambleString(java.lang.String,int,boolean,java.lang.String))
   40. [SendTransmission(int, int, ChatMessage, int)](#SendTransmission(int,int,zombie.chat.ChatMessage,int))
   41. [SendTransmission(int, int, int, String, String, String, float, float, float, int, boolean)](#SendTransmission(int,int,int,java.lang.String,java.lang.String,java.lang.String,float,float,float,int,boolean))
   42. [SendTransmission(long, int, int, int, String, String, String, float, float, float, int, boolean)](#SendTransmission(long,int,int,int,java.lang.String,java.lang.String,java.lang.String,float,float,float,int,boolean))
   43. [PlayerListensChannel(int, boolean, boolean)](#PlayerListensChannel(int,boolean,boolean))
   44. [RegisterDevice(WaveSignalDevice)](#RegisterDevice(zombie.radio.devices.WaveSignalDevice))
   45. [UnRegisterDevice(WaveSignalDevice)](#UnRegisterDevice(zombie.radio.devices.WaveSignalDevice))
   46. [clone()](#clone())
   47. [computerize(String)](#computerize(java.lang.String))
   48. [getRecordedMedia()](#getRecordedMedia())
   49. [setDisableBroadcasting(boolean)](#setDisableBroadcasting(boolean))
   50. [getDisableBroadcasting()](#getDisableBroadcasting())
   51. [setDisableMediaLineLearning(boolean)](#setDisableMediaLineLearning(boolean))
   52. [getDisableMediaLineLearning()](#getDisableMediaLineLearning())
   53. [LouisvilleObfuscationCheck()](#LouisvilleObfuscationCheck())
   54. [ObfuscateChannelCheck(RadioChannel)](#ObfuscateChannelCheck(zombie.radio.scripting.RadioChannel))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ZomboidRadio
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.ZomboidRadio

---

public final class ZomboidRadio
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `ZomboidRadio.FreqListEntry`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<WaveSignalDevice>`

  `broadcastDevices`

  `private final Map<String, Map<Integer,String>>`

  `categorizedChannels`

  `private final Map<Integer,String>`

  `channelNames`

  `private int`

  `daysSinceStart`

  `static final boolean`

  `DEBUG_MODE`

  `static final boolean`

  `DEBUG_SOUND`

  `static final boolean`

  `DEBUG_XML`

  `private zombie.radio.RadioDebugConsole`

  `debugConsole`

  `private final ArrayList<WaveSignalDevice>`

  `devices`

  `static boolean`

  `disableBroadcasting`

  `private final HashMap<Integer, ZomboidRadio.FreqListEntry>`

  `freqlist`

  `private boolean`

  `hasAppliedInterference`

  `private boolean`

  `hasAppliedRangeDistortion`

  `private boolean`

  `hasRecievedServerData`

  `private static ZomboidRadio`

  `instance`

  `private final List<Integer>`

  `knownFrequencies`

  `private int`

  `lastRecordedHour`

  `private String`

  `lastSaveContent`

  `private String`

  `lastSaveFile`

  `static boolean`

  `louisvilleObfuscation`

  `private static final int[]`

  `obfuscateChannels`

  `private final String[]`

  `playerLastLine`

  `static boolean`

  `postRadioSilence`

  `private static RecordedMedia`

  `recordedMedia`

  `static final String`

  `SAVE_FILE`

  `private RadioScriptManager`

  `scriptManager`

  `private static final String[]`

  `staticSounds`

  `private final SLSoundManager`

  `storySoundManager`

  `private final StringBuilder`

  `stringBuilder`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ZomboidRadio()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addChannelName(String name,
  int frequency,
  String category)`

  `void`

  `addChannelName(String name,
  int frequency,
  String category,
  boolean overwrite)`

  `private void`

  `addFrequencyListEntry(boolean isinvitem,
  DeviceData devicedata,
  int x,
  int y)`

  `private String`

  `applyWeatherInterference(String msg,
  int signalStrength)`

  `private void`

  `checkGameModeSpecificStart()`

  `private void`

  `checkPlayerForDevice(IsoPlayer plr,
  IsoPlayer selfPlayer)`

  `Object`

  `clone()`

  `String`

  `computerize(String str)`

  `private boolean`

  `DeviceInRange(int dx,
  int dy,
  int sx,
  int sy,
  int ss)`

  `private void`

  `DistributeToPlayer(IsoPlayer player,
  int sourceX,
  int sourceY,
  int channel,
  String msg,
  String guid,
  String codes,
  float r,
  float g,
  float b,
  int signalStrength,
  boolean isTV)`

  `private void`

  `DistributeToPlayerInternal(WaveSignalDevice radio,
  IsoPlayer player,
  int sourceX,
  int sourceY,
  String msg,
  String guid,
  String codes,
  float r,
  float g,
  float b,
  int signalStrength)`

  `private void`

  `DistributeToPlayerOnClient(IsoPlayer player,
  int sourceX,
  int sourceY,
  int channel,
  String msg,
  String guid,
  String codes,
  float r,
  float g,
  float b,
  int signalStrength,
  boolean isTV)`

  `void`

  `DistributeTransmission(int sourceX,
  int sourceY,
  int channel,
  String msg,
  String guid,
  String codes,
  float r,
  float g,
  float b,
  int signalStrength,
  boolean isTV)`

  `private String`

  `doDeviceRangeDistortion(String msg,
  int signalStrength,
  int dist)`

  `ArrayList<WaveSignalDevice>`

  `getBroadcastDevices()`

  `Map<Integer,String>`

  `GetChannelList(String category)`

  `String`

  `getChannelName(int frequency)`

  `int`

  `getDaysSinceStart()`

  `ArrayList<WaveSignalDevice>`

  `getDevices()`

  `boolean`

  `getDisableBroadcasting()`

  `boolean`

  `getDisableMediaLineLearning()`

  `private int`

  `GetDistance(int dx,
  int dy,
  int sx,
  int sy)`

  `Map<String, Map<Integer,String>>`

  `getFullChannelList()`

  `GameMode`

  `getGameMode()`

  `static ZomboidRadio`

  `getInstance()`

  `String`

  `getRandomBzztFzzt()`

  `int`

  `getRandomFrequency()`

  `int`

  `getRandomFrequency(int rangemin,
  int rangemax)`

  `RecordedMedia`

  `getRecordedMedia()`

  `RadioScriptManager`

  `getScriptManager()`

  `static boolean`

  `hasInstance()`

  `void`

  `Init(int savedWorldVersion)`

  `static boolean`

  `isStaticSound(String str)`

  `boolean`

  `Load()`

  `private void`

  `LouisvilleObfuscationCheck()`

  `static void`

  `ObfuscateChannelCheck(RadioChannel channel)`

  `void`

  `PlayerListensChannel(int channel,
  boolean listenmode,
  boolean isTV)`

  `void`

  `RegisterDevice(WaveSignalDevice device)`

  `void`

  `removeChannelName(int frequency)`

  `void`

  `render()`

  `void`

  `Reset()`

  `void`

  `Save()`

  `private String`

  `scrambleString(String msg,
  int intensity,
  boolean ignoreBBcode)`

  `String`

  `scrambleString(String msg,
  int intensity,
  boolean ignoreBBcode,
  String customScramble)`

  `void`

  `SendTransmission(int sourceX,
  int sourceY,
  int channel,
  String msg,
  String guid,
  String codes,
  float r,
  float g,
  float b,
  int signalStrength,
  boolean isTV)`

  `void`

  `SendTransmission(int sourceX,
  int sourceY,
  ChatMessage msg,
  int signalStrength)`

  `void`

  `SendTransmission(long source,
  int sourceX,
  int sourceY,
  int channel,
  String msg,
  String guid,
  String codes,
  float r,
  float g,
  float b,
  int signalStrength,
  boolean isTV)`

  `void`

  `setDisableBroadcasting(boolean b)`

  `void`

  `setDisableMediaLineLearning(boolean b)`

  `void`

  `setHasRecievedServerData(boolean state)`

  `void`

  `UnRegisterDevice(WaveSignalDevice device)`

  `void`

  `update()`

  `void`

  `UpdateScripts(int hour,
  int mins)`

  `void`

  `WriteRadioServerDataPacket(zombie.core.network.ByteBufferWriter bb)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### SAVE\_FILE

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") SAVE\_FILE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.radio.ZomboidRadio.SAVE_FILE)
  + ### devices

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WaveSignalDevice](devices/WaveSignalDevice.html "interface in zombie.radio.devices")> devices
  + ### broadcastDevices

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WaveSignalDevice](devices/WaveSignalDevice.html "interface in zombie.radio.devices")> broadcastDevices
  + ### scriptManager

    private [RadioScriptManager](scripting/RadioScriptManager.html "class in zombie.radio.scripting") scriptManager
  + ### daysSinceStart

    private int daysSinceStart
  + ### lastRecordedHour

    private int lastRecordedHour
  + ### playerLastLine

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] playerLastLine
  + ### channelNames

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> channelNames
  + ### categorizedChannels

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> categorizedChannels
  + ### knownFrequencies

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> knownFrequencies
  + ### debugConsole

    private zombie.radio.RadioDebugConsole debugConsole
  + ### hasRecievedServerData

    private boolean hasRecievedServerData
  + ### storySoundManager

    private final [SLSoundManager](StorySounds/SLSoundManager.html "class in zombie.radio.StorySounds") storySoundManager
  + ### staticSounds

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] staticSounds
  + ### DEBUG\_MODE

    public static final boolean DEBUG\_MODE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.radio.ZomboidRadio.DEBUG_MODE)
  + ### DEBUG\_XML

    public static final boolean DEBUG\_XML

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.radio.ZomboidRadio.DEBUG_XML)
  + ### DEBUG\_SOUND

    public static final boolean DEBUG\_SOUND

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.radio.ZomboidRadio.DEBUG_SOUND)
  + ### postRadioSilence

    public static boolean postRadioSilence
  + ### disableBroadcasting

    public static boolean disableBroadcasting
  + ### instance

    private static [ZomboidRadio](ZomboidRadio.html "class in zombie.radio") instance
  + ### recordedMedia

    private static [RecordedMedia](media/RecordedMedia.html "class in zombie.radio.media") recordedMedia
  + ### louisvilleObfuscation

    public static boolean louisvilleObfuscation
  + ### lastSaveFile

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastSaveFile
  + ### lastSaveContent

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastSaveContent
  + ### freqlist

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [ZomboidRadio.FreqListEntry](ZomboidRadio.FreqListEntry.html "class in zombie.radio")> freqlist
  + ### hasAppliedRangeDistortion

    private boolean hasAppliedRangeDistortion
  + ### stringBuilder

    private final [StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") stringBuilder
  + ### hasAppliedInterference

    private boolean hasAppliedInterference
  + ### obfuscateChannels

    private static final int[] obfuscateChannels
* Constructor Details
  -------------------

  + ### ZomboidRadio

    private ZomboidRadio()
* Method Details
  --------------

  + ### hasInstance

    public static boolean hasInstance()
  + ### getInstance

    public static [ZomboidRadio](ZomboidRadio.html "class in zombie.radio") getInstance()
  + ### isStaticSound

    public static boolean isStaticSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getScriptManager

    public [RadioScriptManager](scripting/RadioScriptManager.html "class in zombie.radio.scripting") getScriptManager()
  + ### getDaysSinceStart

    public int getDaysSinceStart()
  + ### getDevices

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WaveSignalDevice](devices/WaveSignalDevice.html "interface in zombie.radio.devices")> getDevices()
  + ### getBroadcastDevices

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WaveSignalDevice](devices/WaveSignalDevice.html "interface in zombie.radio.devices")> getBroadcastDevices()
  + ### setHasRecievedServerData

    public void setHasRecievedServerData(boolean state)
  + ### addChannelName

    public void addChannelName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int frequency,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### addChannelName

    public void addChannelName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int frequency,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category,
    boolean overwrite)
  + ### removeChannelName

    public void removeChannelName(int frequency)
  + ### GetChannelList

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> GetChannelList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getChannelName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getChannelName(int frequency)
  + ### getRandomFrequency

    public int getRandomFrequency()
  + ### getRandomFrequency

    public int getRandomFrequency(int rangemin,
    int rangemax)
  + ### getFullChannelList

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> getFullChannelList()
  + ### WriteRadioServerDataPacket

    public void WriteRadioServerDataPacket(zombie.core.network.ByteBufferWriter bb)
  + ### Init

    public void Init(int savedWorldVersion)
  + ### checkGameModeSpecificStart

    private void checkGameModeSpecificStart()
  + ### Save

    public void Save()
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `FileNotFoundException`
    :   `IOException`
  + ### Load

    public boolean Load()
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `FileNotFoundException`
    :   `IOException`
  + ### Reset

    public void Reset()
  + ### UpdateScripts

    public void UpdateScripts(int hour,
    int mins)
  + ### render

    public void render()
  + ### addFrequencyListEntry

    private void addFrequencyListEntry(boolean isinvitem,
    [DeviceData](devices/DeviceData.html "class in zombie.radio.devices") devicedata,
    int x,
    int y)
  + ### update

    public void update()
  + ### checkPlayerForDevice

    private void checkPlayerForDevice([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") plr,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") selfPlayer)
  + ### DeviceInRange

    private boolean DeviceInRange(int dx,
    int dy,
    int sx,
    int sy,
    int ss)
  + ### GetDistance

    private int GetDistance(int dx,
    int dy,
    int sx,
    int sy)
  + ### DistributeToPlayerOnClient

    private void DistributeToPlayerOnClient([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int sourceX,
    int sourceY,
    int channel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    float r,
    float g,
    float b,
    int signalStrength,
    boolean isTV)
  + ### DistributeToPlayer

    private void DistributeToPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int sourceX,
    int sourceY,
    int channel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    float r,
    float g,
    float b,
    int signalStrength,
    boolean isTV)
  + ### DistributeToPlayerInternal

    private void DistributeToPlayerInternal([WaveSignalDevice](devices/WaveSignalDevice.html "interface in zombie.radio.devices") radio,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int sourceX,
    int sourceY,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    float r,
    float g,
    float b,
    int signalStrength)
  + ### DistributeTransmission

    public void DistributeTransmission(int sourceX,
    int sourceY,
    int channel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    float r,
    float g,
    float b,
    int signalStrength,
    boolean isTV)
  + ### doDeviceRangeDistortion

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") doDeviceRangeDistortion([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    int signalStrength,
    int dist)
  + ### getGameMode

    public [GameMode](GameMode.html "enum class in zombie.radio") getGameMode()
  + ### getRandomBzztFzzt

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomBzztFzzt()
  + ### applyWeatherInterference

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") applyWeatherInterference([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    int signalStrength)
  + ### scrambleString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scrambleString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    int intensity,
    boolean ignoreBBcode)
  + ### scrambleString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scrambleString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    int intensity,
    boolean ignoreBBcode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customScramble)
  + ### SendTransmission

    public void SendTransmission(int sourceX,
    int sourceY,
    [ChatMessage](../chat/ChatMessage.html "class in zombie.chat") msg,
    int signalStrength)
  + ### SendTransmission

    public void SendTransmission(int sourceX,
    int sourceY,
    int channel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    float r,
    float g,
    float b,
    int signalStrength,
    boolean isTV)
  + ### SendTransmission

    public void SendTransmission(long source,
    int sourceX,
    int sourceY,
    int channel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    float r,
    float g,
    float b,
    int signalStrength,
    boolean isTV)
  + ### PlayerListensChannel

    public void PlayerListensChannel(int channel,
    boolean listenmode,
    boolean isTV)
  + ### RegisterDevice

    public void RegisterDevice([WaveSignalDevice](devices/WaveSignalDevice.html "interface in zombie.radio.devices") device)
  + ### UnRegisterDevice

    public void UnRegisterDevice([WaveSignalDevice](devices/WaveSignalDevice.html "interface in zombie.radio.devices") device)
  + ### clone

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") clone()

    Overrides:
    :   `clone` in class `Object`
  + ### computerize

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") computerize([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getRecordedMedia

    public [RecordedMedia](media/RecordedMedia.html "class in zombie.radio.media") getRecordedMedia()
  + ### setDisableBroadcasting

    public void setDisableBroadcasting(boolean b)
  + ### getDisableBroadcasting

    public boolean getDisableBroadcasting()
  + ### setDisableMediaLineLearning

    public void setDisableMediaLineLearning(boolean b)
  + ### getDisableMediaLineLearning

    public boolean getDisableMediaLineLearning()
  + ### LouisvilleObfuscationCheck

    private void LouisvilleObfuscationCheck()
  + ### ObfuscateChannelCheck

    public static void ObfuscateChannelCheck([RadioChannel](scripting/RadioChannel.html "class in zombie.radio.scripting") channel)