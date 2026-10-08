[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.scripting](package-summary.html)
2. [RadioScript](RadioScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [broadcasts](#broadcasts)
   2. [exitOptions](#exitOptions)
   3. [guid](#guid)
   4. [name](#name)
   5. [startDay](#startDay)
   6. [startDayStamp](#startDayStamp)
   7. [loopMin](#loopMin)
   8. [loopMax](#loopMax)
   9. [internalStamp](#internalStamp)
   10. [currentBroadcast](#currentBroadcast)
   11. [currentHasAired](#currentHasAired)
7. [Constructor Details](#constructor-detail)
   1. [RadioScript(String, int, int)](#%3Cinit%3E(java.lang.String,int,int))
   2. [RadioScript(String, int, int, String)](#%3Cinit%3E(java.lang.String,int,int,java.lang.String))
8. [Method Details](#method-detail)
   1. [GetGUID()](#GetGUID())
   2. [GetName()](#GetName())
   3. [getStartDayStamp()](#getStartDayStamp())
   4. [getStartDay()](#getStartDay())
   5. [getLoopMin()](#getLoopMin())
   6. [getLoopMax()](#getLoopMax())
   7. [getCurrentBroadcast()](#getCurrentBroadcast())
   8. [getBroadcastList()](#getBroadcastList())
   9. [clearExitOptions()](#clearExitOptions())
   10. [setStartDayStamp(int)](#setStartDayStamp(int))
   11. [getValidAirBroadcast()](#getValidAirBroadcast())
   12. [Reset()](#Reset())
   13. [getNextBroadcast()](#getNextBroadcast())
   14. [getBroadcastWithID(String)](#getBroadcastWithID(java.lang.String))
   15. [UpdateScript(int)](#UpdateScript(int))
   16. [getNextScript()](#getNextScript())
   17. [AddBroadcast(RadioBroadCast)](#AddBroadcast(zombie.radio.scripting.RadioBroadCast))
   18. [AddBroadcast(RadioBroadCast, boolean)](#AddBroadcast(zombie.radio.scripting.RadioBroadCast,boolean))
   19. [AddExitOption(String, int, int)](#AddExitOption(java.lang.String,int,int))
   20. [getValidAirBroadcastDebug()](#getValidAirBroadcastDebug())
   21. [getExitOptions()](#getExitOptions())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RadioScript
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.scripting.RadioScript

---

public final class RadioScript
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `RadioScript.ExitOption`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<RadioBroadCast>`

  `broadcasts`

  `private RadioBroadCast`

  `currentBroadcast`

  `private boolean`

  `currentHasAired`

  `private final ArrayList<RadioScript.ExitOption>`

  `exitOptions`

  `private final String`

  `guid`

  `private int`

  `internalStamp`

  `private final int`

  `loopMax`

  `private final int`

  `loopMin`

  `private final String`

  `name`

  `private int`

  `startDay`

  `private int`

  `startDayStamp`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RadioScript(String n,
  int loopmin,
  int loopmax)`

  `RadioScript(String n,
  int loopmin,
  int loopmax,
  String guid)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddBroadcast(RadioBroadCast broadcast)`

  `void`

  `AddBroadcast(RadioBroadCast broadcast,
  boolean ignoreTimestamps)`

  `void`

  `AddExitOption(String scriptname,
  int chance,
  int startdelay)`

  `void`

  `clearExitOptions()`

  `ArrayList<RadioBroadCast>`

  `getBroadcastList()`

  `RadioBroadCast`

  `getBroadcastWithID(String guid)`

  `RadioBroadCast`

  `getCurrentBroadcast()`

  `ArrayList<RadioScript.ExitOption>`

  `getExitOptions()`

  `String`

  `GetGUID()`

  `int`

  `getLoopMax()`

  `int`

  `getLoopMin()`

  `String`

  `GetName()`

  `private RadioBroadCast`

  `getNextBroadcast()`

  `RadioScript.ExitOption`

  `getNextScript()`

  `int`

  `getStartDay()`

  `int`

  `getStartDayStamp()`

  `RadioBroadCast`

  `getValidAirBroadcast()`

  `RadioBroadCast`

  `getValidAirBroadcastDebug()`

  `void`

  `Reset()`

  `void`

  `setStartDayStamp(int day)`

  `boolean`

  `UpdateScript(int timeStamp)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### broadcasts

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting")> broadcasts
  + ### exitOptions

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioScript.ExitOption](RadioScript.ExitOption.html "class in zombie.radio.scripting")> exitOptions
  + ### guid

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### startDay

    private int startDay
  + ### startDayStamp

    private int startDayStamp
  + ### loopMin

    private final int loopMin
  + ### loopMax

    private final int loopMax
  + ### internalStamp

    private int internalStamp
  + ### currentBroadcast

    private [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") currentBroadcast
  + ### currentHasAired

    private boolean currentHasAired
* Constructor Details
  -------------------

  + ### RadioScript

    public RadioScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    int loopmin,
    int loopmax)
  + ### RadioScript

    public RadioScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    int loopmin,
    int loopmax,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid)
* Method Details
  --------------

  + ### GetGUID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetGUID()
  + ### GetName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetName()
  + ### getStartDayStamp

    public int getStartDayStamp()
  + ### getStartDay

    public int getStartDay()
  + ### getLoopMin

    public int getLoopMin()
  + ### getLoopMax

    public int getLoopMax()
  + ### getCurrentBroadcast

    public [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") getCurrentBroadcast()
  + ### getBroadcastList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting")> getBroadcastList()
  + ### clearExitOptions

    public void clearExitOptions()
  + ### setStartDayStamp

    public void setStartDayStamp(int day)
  + ### getValidAirBroadcast

    public [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") getValidAirBroadcast()
  + ### Reset

    public void Reset()
  + ### getNextBroadcast

    private [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") getNextBroadcast()
  + ### getBroadcastWithID

    public [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") getBroadcastWithID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid)
  + ### UpdateScript

    public boolean UpdateScript(int timeStamp)
  + ### getNextScript

    public [RadioScript.ExitOption](RadioScript.ExitOption.html "class in zombie.radio.scripting") getNextScript()
  + ### AddBroadcast

    public void AddBroadcast([RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") broadcast)
  + ### AddBroadcast

    public void AddBroadcast([RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") broadcast,
    boolean ignoreTimestamps)
  + ### AddExitOption

    public void AddExitOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptname,
    int chance,
    int startdelay)
  + ### getValidAirBroadcastDebug

    public [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") getValidAirBroadcastDebug()
  + ### getExitOptions

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioScript.ExitOption](RadioScript.ExitOption.html "class in zombie.radio.scripting")> getExitOptions()