[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [PVPLogTool](PVPLogTool.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MAX\_EVENTS](#MAX_EVENTS)
   2. [events](#events)
7. [Constructor Details](#constructor-detail)
   1. [PVPLogTool()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [clearEvents()](#clearEvents())
   2. [getEvents()](#getEvents())
   3. [logSafety(IsoPlayer, String)](#logSafety(zombie.characters.IsoPlayer,java.lang.String))
   4. [logKill(IsoPlayer, IsoPlayer)](#logKill(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer))
   5. [logCombat(String, String, String, String, float, float, float, String, float)](#logCombat(java.lang.String,java.lang.String,java.lang.String,java.lang.String,float,float,float,java.lang.String,float))
   6. [log(String, String, String)](#log(java.lang.String,java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PVPLogTool
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.PVPLogTool

---

public class PVPLogTool
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `PVPLogTool.PVPEvent`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<PVPLogTool.PVPEvent>`

  `events`

  `private static final int`

  `MAX_EVENTS`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `PVPLogTool()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `clearEvents()`

  `static ArrayList<PVPLogTool.PVPEvent>`

  `getEvents()`

  `private static void`

  `log(String message,
  String text,
  String level)`

  `static void`

  `logCombat(String wielder,
  String wielderPosition,
  String target,
  String targetPosition,
  float x,
  float y,
  float z,
  String weapon,
  float damage)`

  `static void`

  `logKill(IsoPlayer wielder,
  IsoPlayer target)`

  `static void`

  `logSafety(IsoPlayer player,
  String event)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### MAX\_EVENTS

    private static final int MAX\_EVENTS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.PVPLogTool.MAX_EVENTS)
  + ### events

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PVPLogTool.PVPEvent](PVPLogTool.PVPEvent.html "class in zombie.network")> events
* Constructor Details
  -------------------

  + ### PVPLogTool

    private PVPLogTool()
* Method Details
  --------------

  + ### clearEvents

    public static void clearEvents()
  + ### getEvents

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PVPLogTool.PVPEvent](PVPLogTool.PVPEvent.html "class in zombie.network")> getEvents()
  + ### logSafety

    public static void logSafety([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event)
  + ### logKill

    public static void logKill([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") wielder,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") target)
  + ### logCombat

    public static void logCombat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wielder,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wielderPosition,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") target,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") targetPosition,
    float x,
    float y,
    float z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") weapon,
    float damage)
  + ### log

    private static void log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") level)