[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.Lua](package-summary.html)
2. [LuaEventManager](LuaEventManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [OnTickCallbacks](#OnTickCallbacks)
   2. [a1](#a1)
   3. [a2](#a2)
   4. [a3](#a3)
   5. [a4](#a4)
   6. [a5](#a5)
   7. [a6](#a6)
   8. [a7](#a7)
   9. [a8](#a8)
   10. [a1index](#a1index)
   11. [a2index](#a2index)
   12. [a3index](#a3index)
   13. [a4index](#a4index)
   14. [a5index](#a5index)
   15. [a6index](#a6index)
   16. [a7index](#a7index)
   17. [a8index](#a8index)
   18. [EventList](#EventList)
   19. [EventMap](#EventMap)
   20. [QueuedEvents](#QueuedEvents)
7. [Constructor Details](#constructor-detail)
   1. [LuaEventManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [IsMainThread()](#IsMainThread())
   2. [AddQueuedEvent(LuaEventManager.QueuedEvent)](#AddQueuedEvent(zombie.Lua.LuaEventManager.QueuedEvent))
   3. [QueueEvent(Event)](#QueueEvent(zombie.Lua.Event))
   4. [QueueEvent(Event, Object)](#QueueEvent(zombie.Lua.Event,java.lang.Object))
   5. [QueueEvent(Event, Object, Object)](#QueueEvent(zombie.Lua.Event,java.lang.Object,java.lang.Object))
   6. [QueueEvent(Event, Object, Object, Object)](#QueueEvent(zombie.Lua.Event,java.lang.Object,java.lang.Object,java.lang.Object))
   7. [QueueEvent(Event, Object, Object, Object, Object)](#QueueEvent(zombie.Lua.Event,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   8. [QueueEvent(Event, Object, Object, Object, Object, Object)](#QueueEvent(zombie.Lua.Event,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   9. [QueueEvent(Event, Object, Object, Object, Object, Object, Object)](#QueueEvent(zombie.Lua.Event,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   10. [QueueEvent(Event, Object, Object, Object, Object, Object, Object, Object)](#QueueEvent(zombie.Lua.Event,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   11. [QueueEvent(Event, Object, Object, Object, Object, Object, Object, Object, Object)](#QueueEvent(zombie.Lua.Event,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   12. [RunQueuedEvents()](#RunQueuedEvents())
   13. [RunQueuedEventsInternal()](#RunQueuedEventsInternal())
   14. [RunQueuedEvent(LuaEventManager.QueuedEvent, int, Object[][])](#RunQueuedEvent(zombie.Lua.LuaEventManager.QueuedEvent,int,java.lang.Object%5B%5D%5B%5D))
   15. [checkEvent(String)](#checkEvent(java.lang.String))
   16. [triggerEvent(String)](#triggerEvent(java.lang.String))
   17. [triggerEvent(String, Object)](#triggerEvent(java.lang.String,java.lang.Object))
   18. [triggerEventGarbage(String, Object)](#triggerEventGarbage(java.lang.String,java.lang.Object))
   19. [triggerEventUnique(String, Object)](#triggerEventUnique(java.lang.String,java.lang.Object))
   20. [triggerEvent(String, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object))
   21. [triggerEventGarbage(String, Object, Object)](#triggerEventGarbage(java.lang.String,java.lang.Object,java.lang.Object))
   22. [triggerEvent(String, Object, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))
   23. [triggerEventGarbage(String, Object, Object, Object)](#triggerEventGarbage(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))
   24. [triggerEvent(String, Object, Object, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   25. [triggerEventGarbage(String, Object, Object, Object, Object)](#triggerEventGarbage(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   26. [triggerEvent(String, Object, Object, Object, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   27. [triggerEvent(String, Object, Object, Object, Object, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   28. [triggerEvent(String, Object, Object, Object, Object, Object, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   29. [triggerEvent(String, Object, Object, Object, Object, Object, Object, Object, Object)](#triggerEvent(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   30. [AddEvent(String)](#AddEvent(java.lang.String))
   31. [AddEvents()](#AddEvents())
   32. [clear()](#clear())
   33. [register(Platform, KahluaTable)](#register(se.krka.kahlua.vm.Platform,se.krka.kahlua.vm.KahluaTable))
   34. [reroute(Prototype, LuaClosure)](#reroute(se.krka.kahlua.vm.Prototype,se.krka.kahlua.vm.LuaClosure))
   35. [Reset()](#Reset())
   36. [getEvents(ArrayList, HashMap)](#getEvents(java.util.ArrayList,java.util.HashMap))
   37. [setEvents(ArrayList, HashMap)](#setEvents(java.util.ArrayList,java.util.HashMap))
   38. [ResetCallbacks()](#ResetCallbacks())
   39. [call(LuaCallFrame, int)](#call(se.krka.kahlua.vm.LuaCallFrame,int))
   40. [OnTick(LuaCallFrame, int)](#OnTick(se.krka.kahlua.vm.LuaCallFrame,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LuaEventManager
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.Lua.LuaEventManager

All Implemented Interfaces:
:   `se.krka.kahlua.vm.JavaFunction`

---

public final class LuaEventManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements se.krka.kahlua.vm.JavaFunction

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `LuaEventManager.QueuedEvent`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static Object[][]`

  `a1`

  `private static int`

  `a1index`

  `private static Object[][]`

  `a2`

  `private static int`

  `a2index`

  `private static Object[][]`

  `a3`

  `private static int`

  `a3index`

  `private static Object[][]`

  `a4`

  `private static int`

  `a4index`

  `private static Object[][]`

  `a5`

  `private static int`

  `a5index`

  `private static Object[][]`

  `a6`

  `private static int`

  `a6index`

  `private static Object[][]`

  `a7`

  `private static int`

  `a7index`

  `private static Object[][]`

  `a8`

  `private static int`

  `a8index`

  `private static final ArrayList<zombie.Lua.Event>`

  `EventList`

  `private static final HashMap<String, zombie.Lua.Event>`

  `EventMap`

  `static final ArrayList<se.krka.kahlua.vm.LuaClosure>`

  `OnTickCallbacks`

  `private static final ArrayList<LuaEventManager.QueuedEvent>`

  `QueuedEvents`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LuaEventManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static zombie.Lua.Event`

  `AddEvent(String name)`

  `private static void`

  `AddEvents()`

  `private static void`

  `AddQueuedEvent(LuaEventManager.QueuedEvent qe)`

  `int`

  `call(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int nArguments)`

  This interface defines functions which the Kahlua engine can call.

  `private static zombie.Lua.Event`

  `checkEvent(String event)`

  `static void`

  `clear()`

  `static void`

  `getEvents(ArrayList<zombie.Lua.Event> eventList,
  HashMap<String, zombie.Lua.Event> eventMap)`

  `private static boolean`

  `IsMainThread()`

  `private int`

  `OnTick(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int nArguments)`

  `private static void`

  `QueueEvent(zombie.Lua.Event e)`

  `private static void`

  `QueueEvent(zombie.Lua.Event e,
  Object p1)`

  `private static void`

  `QueueEvent(zombie.Lua.Event e,
  Object p1,
  Object p2)`

  `private static void`

  `QueueEvent(zombie.Lua.Event e,
  Object p1,
  Object p2,
  Object p3)`

  `private static void`

  `QueueEvent(zombie.Lua.Event e,
  Object p1,
  Object p2,
  Object p3,
  Object p4)`

  `private static void`

  `QueueEvent(zombie.Lua.Event e,
  Object p1,
  Object p2,
  Object p3,
  Object p4,
  Object p5)`

  `private static void`

  `QueueEvent(zombie.Lua.Event e,
  Object p1,
  Object p2,
  Object p3,
  Object p4,
  Object p5,
  Object p6)`

  `private static void`

  `QueueEvent(zombie.Lua.Event e,
  Object p1,
  Object p2,
  Object p3,
  Object p4,
  Object p5,
  Object p6,
  Object p7)`

  `private static void`

  `QueueEvent(zombie.Lua.Event e,
  Object p1,
  Object p2,
  Object p3,
  Object p4,
  Object p5,
  Object p6,
  Object p7,
  Object p8)`

  `static void`

  `register(se.krka.kahlua.vm.Platform platform,
  se.krka.kahlua.vm.KahluaTable environment)`

  `static void`

  `reroute(se.krka.kahlua.vm.Prototype prototype,
  se.krka.kahlua.vm.LuaClosure luaClosure)`

  `static void`

  `Reset()`

  `static void`

  `ResetCallbacks()`

  `private static void`

  `RunQueuedEvent(LuaEventManager.QueuedEvent qe,
  int index,
  Object[][] ax)`

  `static void`

  `RunQueuedEvents()`

  `private static void`

  `RunQueuedEventsInternal()`

  `static void`

  `setEvents(ArrayList<zombie.Lua.Event> eventList,
  HashMap<String, zombie.Lua.Event> eventMap)`

  `static void`

  `triggerEvent(String event)`

  `static void`

  `triggerEvent(String event,
  Object param1)`

  `static void`

  `triggerEvent(String event,
  Object param1,
  Object param2)`

  `static void`

  `triggerEvent(String event,
  Object param1,
  Object param2,
  Object param3)`

  `static void`

  `triggerEvent(String event,
  Object param1,
  Object param2,
  Object param3,
  Object param4)`

  `static void`

  `triggerEvent(String event,
  Object param1,
  Object param2,
  Object param3,
  Object param4,
  Object param5)`

  `static void`

  `triggerEvent(String event,
  Object param1,
  Object param2,
  Object param3,
  Object param4,
  Object param5,
  Object param6)`

  `static void`

  `triggerEvent(String event,
  Object param1,
  Object param2,
  Object param3,
  Object param4,
  Object param5,
  Object param6,
  Object param7)`

  `static void`

  `triggerEvent(String event,
  Object param1,
  Object param2,
  Object param3,
  Object param4,
  Object param5,
  Object param6,
  Object param7,
  Object param8)`

  `static void`

  `triggerEventGarbage(String event,
  Object param1)`

  `static void`

  `triggerEventGarbage(String event,
  Object param1,
  Object param2)`

  `static void`

  `triggerEventGarbage(String event,
  Object param1,
  Object param2,
  Object param3)`

  `static void`

  `triggerEventGarbage(String event,
  Object param1,
  Object param2,
  Object param3,
  Object param4)`

  `static void`

  `triggerEventUnique(String event,
  Object param1)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### OnTickCallbacks

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<se.krka.kahlua.vm.LuaClosure> OnTickCallbacks
  + ### a1

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[][] a1
  + ### a2

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[][] a2
  + ### a3

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[][] a3
  + ### a4

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[][] a4
  + ### a5

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[][] a5
  + ### a6

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[][] a6
  + ### a7

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[][] a7
  + ### a8

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[][] a8
  + ### a1index

    private static int a1index
  + ### a2index

    private static int a2index
  + ### a3index

    private static int a3index
  + ### a4index

    private static int a4index
  + ### a5index

    private static int a5index
  + ### a6index

    private static int a6index
  + ### a7index

    private static int a7index
  + ### a8index

    private static int a8index
  + ### EventList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.Lua.Event> EventList
  + ### EventMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.Lua.Event> EventMap
  + ### QueuedEvents

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[LuaEventManager.QueuedEvent](LuaEventManager.QueuedEvent.html "class in zombie.Lua")> QueuedEvents
* Constructor Details
  -------------------

  + ### LuaEventManager

    public LuaEventManager()
* Method Details
  --------------

  + ### IsMainThread

    private static boolean IsMainThread()
  + ### AddQueuedEvent

    private static void AddQueuedEvent([LuaEventManager.QueuedEvent](LuaEventManager.QueuedEvent.html "class in zombie.Lua") qe)
  + ### QueueEvent

    private static void QueueEvent(zombie.Lua.Event e)
  + ### QueueEvent

    private static void QueueEvent(zombie.Lua.Event e,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p1)
  + ### QueueEvent

    private static void QueueEvent(zombie.Lua.Event e,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p2)
  + ### QueueEvent

    private static void QueueEvent(zombie.Lua.Event e,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p3)
  + ### QueueEvent

    private static void QueueEvent(zombie.Lua.Event e,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p4)
  + ### QueueEvent

    private static void QueueEvent(zombie.Lua.Event e,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p5)
  + ### QueueEvent

    private static void QueueEvent(zombie.Lua.Event e,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p5,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p6)
  + ### QueueEvent

    private static void QueueEvent(zombie.Lua.Event e,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p5,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p6,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p7)
  + ### QueueEvent

    private static void QueueEvent(zombie.Lua.Event e,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p5,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p6,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p7,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") p8)
  + ### RunQueuedEvents

    public static void RunQueuedEvents()
  + ### RunQueuedEventsInternal

    private static void RunQueuedEventsInternal()
  + ### RunQueuedEvent

    private static void RunQueuedEvent([LuaEventManager.QueuedEvent](LuaEventManager.QueuedEvent.html "class in zombie.Lua") qe,
    int index,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[][] ax)
  + ### checkEvent

    private static zombie.Lua.Event checkEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1)
  + ### triggerEventGarbage

    public static void triggerEventGarbage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1)
  + ### triggerEventUnique

    public static void triggerEventUnique([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2)
  + ### triggerEventGarbage

    public static void triggerEventGarbage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3)
  + ### triggerEventGarbage

    public static void triggerEventGarbage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param4)
  + ### triggerEventGarbage

    public static void triggerEventGarbage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param4)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param5)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param5,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param6)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param5,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param6,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param7)
  + ### triggerEvent

    public static void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param5,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param6,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param7,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param8)
  + ### AddEvent

    public static zombie.Lua.Event AddEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### AddEvents

    private static void AddEvents()
  + ### clear

    public static void clear()
  + ### register

    public static void register(se.krka.kahlua.vm.Platform platform,
    se.krka.kahlua.vm.KahluaTable environment)
  + ### reroute

    public static void reroute(se.krka.kahlua.vm.Prototype prototype,
    se.krka.kahlua.vm.LuaClosure luaClosure)
  + ### Reset

    public static void Reset()
  + ### getEvents

    public static void getEvents([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.Lua.Event> eventList,
    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.Lua.Event> eventMap)
  + ### setEvents

    public static void setEvents([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.Lua.Event> eventList,
    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.Lua.Event> eventMap)
  + ### ResetCallbacks

    public static void ResetCallbacks()
  + ### call

    public int call(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int nArguments)

    Description copied from interface: `se.krka.kahlua.vm.JavaFunction`

    This interface defines functions which the Kahlua engine can call.

    General contract:

    ```
     callFrame.get(i) = an argument (0 invalid input: '<'= i invalid input: '<' nArguments)
    ```

    Return (possibly) values to lua by calling:

    ```
     callFrame.push(value1);
     callFrame.push(value2);
     return 2; // number of pushed values
    ```

    Specified by:
    :   `call` in interface `se.krka.kahlua.vm.JavaFunction`

    Parameters:
    :   `callFrame` - - the frame that contains all the arguments and where all the results should be put.
    :   `nArguments` - - number of function arguments

    Returns:
    :   N, number of return values. The top N objects on the stack are considered the return values.
  + ### OnTick

    private int OnTick(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int nArguments)