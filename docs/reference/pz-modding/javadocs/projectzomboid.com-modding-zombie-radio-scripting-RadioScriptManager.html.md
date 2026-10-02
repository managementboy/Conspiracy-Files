[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.scripting](package-summary.html)
2. [RadioScriptManager](RadioScriptManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [channels](#channels)
   2. [instance](#instance)
   3. [currentTimeStamp](#currentTimeStamp)
   4. [channelsList](#channelsList)
6. [Constructor Details](#constructor-detail)
   1. [RadioScriptManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [hasInstance()](#hasInstance())
   2. [getInstance()](#getInstance())
   3. [init(int)](#init(int))
   4. [getChannels()](#getChannels())
   5. [getChannelsList()](#getChannelsList())
   6. [getRadioChannel(String)](#getRadioChannel(java.lang.String))
   7. [simulateScriptsUntil(int, boolean)](#simulateScriptsUntil(int,boolean))
   8. [simulateChannelUntil(int, int, boolean)](#simulateChannelUntil(int,int,boolean))
   9. [getCurrentTimeStamp()](#getCurrentTimeStamp())
   10. [PlayerListensChannel(int, boolean, boolean)](#PlayerListensChannel(int,boolean,boolean))
   11. [AddChannel(RadioChannel, boolean)](#AddChannel(zombie.radio.scripting.RadioChannel,boolean))
   12. [RemoveChannel(int)](#RemoveChannel(int))
   13. [UpdateScripts(int, int, int)](#UpdateScripts(int,int,int))
   14. [update()](#update())
   15. [reset()](#reset())
   16. [Save(Writer)](#Save(java.io.Writer))
   17. [Load(List)](#Load(java.util.List))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RadioScriptManager
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.scripting.RadioScriptManager

---

public final class RadioScriptManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Map<Integer, RadioChannel>`

  `channels`

  `private final ArrayList<RadioChannel>`

  `channelsList`

  `private int`

  `currentTimeStamp`

  `private static RadioScriptManager`

  `instance`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `RadioScriptManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddChannel(RadioChannel channel,
  boolean overwrite)`

  `Map<Integer, RadioChannel>`

  `getChannels()`

  `ArrayList<RadioChannel>`

  `getChannelsList()`

  `int`

  `getCurrentTimeStamp()`

  `static RadioScriptManager`

  `getInstance()`

  `RadioChannel`

  `getRadioChannel(String uuid)`

  `static boolean`

  `hasInstance()`

  `void`

  `init(int savedWorldVersion)`

  `void`

  `Load(List<String> channelLines)`

  `void`

  `PlayerListensChannel(int chanfrequency,
  boolean mode,
  boolean sourceIsTV)`

  `void`

  `RemoveChannel(int frequency)`

  `void`

  `reset()`

  `void`

  `Save(Writer w)`

  `void`

  `simulateChannelUntil(int frequency,
  int days,
  boolean force)`

  `void`

  `simulateScriptsUntil(int days,
  boolean force)`

  `void`

  `update()`

  `void`

  `UpdateScripts(int day,
  int hour,
  int mins)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### channels

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [RadioChannel](RadioChannel.html "class in zombie.radio.scripting")> channels
  + ### instance

    private static [RadioScriptManager](RadioScriptManager.html "class in zombie.radio.scripting") instance
  + ### currentTimeStamp

    private int currentTimeStamp
  + ### channelsList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioChannel](RadioChannel.html "class in zombie.radio.scripting")> channelsList
* Constructor Details
  -------------------

  + ### RadioScriptManager

    private RadioScriptManager()
* Method Details
  --------------

  + ### hasInstance

    public static boolean hasInstance()
  + ### getInstance

    public static [RadioScriptManager](RadioScriptManager.html "class in zombie.radio.scripting") getInstance()
  + ### init

    public void init(int savedWorldVersion)
  + ### getChannels

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [RadioChannel](RadioChannel.html "class in zombie.radio.scripting")> getChannels()
  + ### getChannelsList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioChannel](RadioChannel.html "class in zombie.radio.scripting")> getChannelsList()
  + ### getRadioChannel

    public [RadioChannel](RadioChannel.html "class in zombie.radio.scripting") getRadioChannel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") uuid)
  + ### simulateScriptsUntil

    public void simulateScriptsUntil(int days,
    boolean force)
  + ### simulateChannelUntil

    public void simulateChannelUntil(int frequency,
    int days,
    boolean force)
  + ### getCurrentTimeStamp

    public int getCurrentTimeStamp()
  + ### PlayerListensChannel

    public void PlayerListensChannel(int chanfrequency,
    boolean mode,
    boolean sourceIsTV)
  + ### AddChannel

    public void AddChannel([RadioChannel](RadioChannel.html "class in zombie.radio.scripting") channel,
    boolean overwrite)
  + ### RemoveChannel

    public void RemoveChannel(int frequency)
  + ### UpdateScripts

    public void UpdateScripts(int day,
    int hour,
    int mins)
  + ### update

    public void update()
  + ### reset

    public void reset()
  + ### Save

    public void Save([Writer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Writer.html "class or interface in java.io") w)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### Load

    public void Load([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> channelLines)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io"),
    [NumberFormatException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/NumberFormatException.html "class or interface in java.lang")

    Throws:
    :   `IOException`
    :   `NumberFormatException`