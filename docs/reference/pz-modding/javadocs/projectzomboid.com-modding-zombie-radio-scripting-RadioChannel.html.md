[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.scripting](package-summary.html)
2. [RadioChannel](RadioChannel.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [guid](#guid)
   2. [radioData](#radioData)
   3. [isTimeSynced](#isTimeSynced)
   4. [scripts](#scripts)
   5. [frequency](#frequency)
   6. [name](#name)
   7. [isTv](#isTv)
   8. [category](#category)
   9. [playerIsListening](#playerIsListening)
   10. [currentScript](#currentScript)
   11. [currentScriptLoop](#currentScriptLoop)
   12. [currentScriptMaxLoops](#currentScriptMaxLoops)
   13. [airingBroadcast](#airingBroadcast)
   14. [airCounter](#airCounter)
   15. [lastAiredLine](#lastAiredLine)
   16. [lastBroadcastId](#lastBroadcastId)
   17. [airCounterMultiplier](#airCounterMultiplier)
   18. [louisvilleObfuscate](#louisvilleObfuscate)
   19. [minmod](#minmod)
   20. [maxmod](#maxmod)
6. [Constructor Details](#constructor-detail)
   1. [RadioChannel(String, int, ChannelCategory)](#%3Cinit%3E(java.lang.String,int,zombie.radio.ChannelCategory))
   2. [RadioChannel(String, int, ChannelCategory, String)](#%3Cinit%3E(java.lang.String,int,zombie.radio.ChannelCategory,java.lang.String))
7. [Method Details](#method-detail)
   1. [getGUID()](#getGUID())
   2. [GetFrequency()](#GetFrequency())
   3. [GetName()](#GetName())
   4. [IsTv()](#IsTv())
   5. [GetCategory()](#GetCategory())
   6. [getCurrentScript()](#getCurrentScript())
   7. [getAiringBroadcast()](#getAiringBroadcast())
   8. [getLastAiredLine()](#getLastAiredLine())
   9. [getCurrentScriptLoop()](#getCurrentScriptLoop())
   10. [getCurrentScriptMaxLoops()](#getCurrentScriptMaxLoops())
   11. [getLastBroadcastID()](#getLastBroadcastID())
   12. [getRadioData()](#getRadioData())
   13. [setRadioData(RadioData)](#setRadioData(zombie.radio.RadioData))
   14. [isTimeSynced()](#isTimeSynced())
   15. [setTimeSynced(boolean)](#setTimeSynced(boolean))
   16. [isVanilla()](#isVanilla())
   17. [setLouisvilleObfuscate(boolean)](#setLouisvilleObfuscate(boolean))
   18. [LoadAiringBroadcast(String, int)](#LoadAiringBroadcast(java.lang.String,int))
   19. [SetPlayerIsListening(boolean)](#SetPlayerIsListening(boolean))
   20. [GetPlayerIsListening()](#GetPlayerIsListening())
   21. [setActiveScriptNull()](#setActiveScriptNull())
   22. [setActiveScript(String, int)](#setActiveScript(java.lang.String,int))
   23. [setActiveScript(String, int, int, int)](#setActiveScript(java.lang.String,int,int,int))
   24. [getNextScript(int)](#getNextScript(int))
   25. [UpdateScripts(int, int)](#UpdateScripts(int,int))
   26. [update()](#update())
   27. [AddRadioScript(RadioScript)](#AddRadioScript(zombie.radio.scripting.RadioScript))
   28. [getRadioScript(String)](#getRadioScript(java.lang.String))
   29. [setAiringBroadcast(RadioBroadCast)](#setAiringBroadcast(zombie.radio.scripting.RadioBroadCast))
   30. [getAirCounterMultiplier()](#getAirCounterMultiplier())
   31. [setAirCounterMultiplier(float)](#setAirCounterMultiplier(float))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RadioChannel
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.scripting.RadioChannel

Direct Known Subclasses:
:   `DynamicRadioChannel`

---

public class RadioChannel
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `airCounter`

  `private float`

  `airCounterMultiplier`

  `private RadioBroadCast`

  `airingBroadcast`

  `private ChannelCategory`

  `category`

  `private RadioScript`

  `currentScript`

  `private int`

  `currentScriptLoop`

  `private int`

  `currentScriptMaxLoops`

  `private int`

  `frequency`

  `private final String`

  `guid`

  `private boolean`

  `isTimeSynced`

  `private final boolean`

  `isTv`

  `private String`

  `lastAiredLine`

  `private String`

  `lastBroadcastId`

  `private boolean`

  `louisvilleObfuscate`

  `(package private) float`

  `maxmod`

  `(package private) float`

  `minmod`

  `private String`

  `name`

  `private boolean`

  `playerIsListening`

  `private RadioData`

  `radioData`

  `private final Map<String, RadioScript>`

  `scripts`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RadioChannel(String n,
  int freq,
  ChannelCategory c)`

  `RadioChannel(String n,
  int freq,
  ChannelCategory c,
  String guid)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddRadioScript(RadioScript script)`

  `float`

  `getAirCounterMultiplier()`

  `RadioBroadCast`

  `getAiringBroadcast()`

  `ChannelCategory`

  `GetCategory()`

  `RadioScript`

  `getCurrentScript()`

  `int`

  `getCurrentScriptLoop()`

  `int`

  `getCurrentScriptMaxLoops()`

  `int`

  `GetFrequency()`

  `String`

  `getGUID()`

  `String`

  `getLastAiredLine()`

  `String`

  `getLastBroadcastID()`

  `String`

  `GetName()`

  `private void`

  `getNextScript(int day)`

  `boolean`

  `GetPlayerIsListening()`

  `RadioData`

  `getRadioData()`

  `RadioScript`

  `getRadioScript(String script)`

  `boolean`

  `isTimeSynced()`

  `boolean`

  `IsTv()`

  `boolean`

  `isVanilla()`

  `void`

  `LoadAiringBroadcast(String guid,
  int line)`

  `void`

  `setActiveScript(String scriptName,
  int day)`

  `void`

  `setActiveScript(String scriptName,
  int day,
  int loop,
  int maxloops)`

  `void`

  `setActiveScriptNull()`

  `void`

  `setAirCounterMultiplier(float airCounterMultiplier)`

  `void`

  `setAiringBroadcast(RadioBroadCast bc)`

  `void`

  `setLouisvilleObfuscate(boolean b)`

  `void`

  `SetPlayerIsListening(boolean isListening)`

  `void`

  `setRadioData(RadioData radioData)`

  `void`

  `setTimeSynced(boolean isTimeSynced)`

  `void`

  `update()`

  `void`

  `UpdateScripts(int timestamp,
  int day)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### guid

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid
  + ### radioData

    private [RadioData](../RadioData.html "class in zombie.radio") radioData
  + ### isTimeSynced

    private boolean isTimeSynced
  + ### scripts

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [RadioScript](RadioScript.html "class in zombie.radio.scripting")> scripts
  + ### frequency

    private int frequency
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### isTv

    private final boolean isTv
  + ### category

    private [ChannelCategory](../ChannelCategory.html "enum class in zombie.radio") category
  + ### playerIsListening

    private boolean playerIsListening
  + ### currentScript

    private [RadioScript](RadioScript.html "class in zombie.radio.scripting") currentScript
  + ### currentScriptLoop

    private int currentScriptLoop
  + ### currentScriptMaxLoops

    private int currentScriptMaxLoops
  + ### airingBroadcast

    private [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") airingBroadcast
  + ### airCounter

    private float airCounter
  + ### lastAiredLine

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastAiredLine
  + ### lastBroadcastId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastBroadcastId
  + ### airCounterMultiplier

    private float airCounterMultiplier
  + ### louisvilleObfuscate

    private boolean louisvilleObfuscate
  + ### minmod

    float minmod
  + ### maxmod

    float maxmod
* Constructor Details
  -------------------

  + ### RadioChannel

    public RadioChannel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    int freq,
    [ChannelCategory](../ChannelCategory.html "enum class in zombie.radio") c)
  + ### RadioChannel

    public RadioChannel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    int freq,
    [ChannelCategory](../ChannelCategory.html "enum class in zombie.radio") c,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid)
* Method Details
  --------------

  + ### getGUID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGUID()
  + ### GetFrequency

    public int GetFrequency()
  + ### GetName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetName()
  + ### IsTv

    public boolean IsTv()
  + ### GetCategory

    public [ChannelCategory](../ChannelCategory.html "enum class in zombie.radio") GetCategory()
  + ### getCurrentScript

    public [RadioScript](RadioScript.html "class in zombie.radio.scripting") getCurrentScript()
  + ### getAiringBroadcast

    public [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") getAiringBroadcast()
  + ### getLastAiredLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastAiredLine()
  + ### getCurrentScriptLoop

    public int getCurrentScriptLoop()
  + ### getCurrentScriptMaxLoops

    public int getCurrentScriptMaxLoops()
  + ### getLastBroadcastID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastBroadcastID()
  + ### getRadioData

    public [RadioData](../RadioData.html "class in zombie.radio") getRadioData()
  + ### setRadioData

    public void setRadioData([RadioData](../RadioData.html "class in zombie.radio") radioData)
  + ### isTimeSynced

    public boolean isTimeSynced()
  + ### setTimeSynced

    public void setTimeSynced(boolean isTimeSynced)
  + ### isVanilla

    public boolean isVanilla()
  + ### setLouisvilleObfuscate

    public void setLouisvilleObfuscate(boolean b)
  + ### LoadAiringBroadcast

    public void LoadAiringBroadcast([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    int line)
  + ### SetPlayerIsListening

    public void SetPlayerIsListening(boolean isListening)
  + ### GetPlayerIsListening

    public boolean GetPlayerIsListening()
  + ### setActiveScriptNull

    public void setActiveScriptNull()
  + ### setActiveScript

    public void setActiveScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    int day)
  + ### setActiveScript

    public void setActiveScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    int day,
    int loop,
    int maxloops)
  + ### getNextScript

    private void getNextScript(int day)
  + ### UpdateScripts

    public void UpdateScripts(int timestamp,
    int day)
  + ### update

    public void update()
  + ### AddRadioScript

    public void AddRadioScript([RadioScript](RadioScript.html "class in zombie.radio.scripting") script)
  + ### getRadioScript

    public [RadioScript](RadioScript.html "class in zombie.radio.scripting") getRadioScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") script)
  + ### setAiringBroadcast

    public void setAiringBroadcast([RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") bc)
  + ### getAirCounterMultiplier

    public float getAirCounterMultiplier()
  + ### setAirCounterMultiplier

    public void setAirCounterMultiplier(float airCounterMultiplier)