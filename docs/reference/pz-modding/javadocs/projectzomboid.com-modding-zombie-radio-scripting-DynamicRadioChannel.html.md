[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.scripting](package-summary.html)
2. [DynamicRadioChannel](DynamicRadioChannel.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [DynamicRadioChannel(String, int, ChannelCategory)](#%3Cinit%3E(java.lang.String,int,zombie.radio.ChannelCategory))
   2. [DynamicRadioChannel(String, int, ChannelCategory, String)](#%3Cinit%3E(java.lang.String,int,zombie.radio.ChannelCategory,java.lang.String))
6. [Method Details](#method-detail)
   1. [LoadAiringBroadcast(String, int)](#LoadAiringBroadcast(java.lang.String,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class DynamicRadioChannel
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.radio.scripting.RadioChannel](RadioChannel.html "class in zombie.radio.scripting")

zombie.radio.scripting.DynamicRadioChannel

---

public final class DynamicRadioChannel
extends [RadioChannel](RadioChannel.html "class in zombie.radio.scripting")

* Field Summary
  -------------

  ### Fields inherited from class [RadioChannel](RadioChannel.html#field-summary "class in zombie.radio.scripting")

  `maxmod, minmod`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DynamicRadioChannel(String n,
  int freq,
  ChannelCategory c)`

  `DynamicRadioChannel(String n,
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

  `LoadAiringBroadcast(String guid,
  int line)`

  ### Methods inherited from class [RadioChannel](RadioChannel.html#method-summary "class in zombie.radio.scripting")

  `AddRadioScript, getAirCounterMultiplier, getAiringBroadcast, GetCategory, getCurrentScript, getCurrentScriptLoop, getCurrentScriptMaxLoops, GetFrequency, getGUID, getLastAiredLine, getLastBroadcastID, GetName, GetPlayerIsListening, getRadioData, getRadioScript, isTimeSynced, IsTv, isVanilla, setActiveScript, setActiveScript, setActiveScriptNull, setAirCounterMultiplier, setAiringBroadcast, setLouisvilleObfuscate, SetPlayerIsListening, setRadioData, setTimeSynced, update, UpdateScripts`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### DynamicRadioChannel

    public DynamicRadioChannel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    int freq,
    [ChannelCategory](../ChannelCategory.html "enum class in zombie.radio") c)
  + ### DynamicRadioChannel

    public DynamicRadioChannel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    int freq,
    [ChannelCategory](../ChannelCategory.html "enum class in zombie.radio") c,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid)
* Method Details
  --------------

  + ### LoadAiringBroadcast

    public void LoadAiringBroadcast([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    int line)

    Overrides:
    :   `LoadAiringBroadcast` in class `RadioChannel`