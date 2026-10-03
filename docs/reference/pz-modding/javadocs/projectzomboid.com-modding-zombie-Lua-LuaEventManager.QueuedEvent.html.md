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
3. [QueuedEvent](LuaEventManager.QueuedEvent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [EventPool](#EventPool)
   2. [e](#e)
   3. [a](#a)
6. [Constructor Details](#constructor-detail)
   1. [QueuedEvent()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LuaEventManager.QueuedEvent
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.util.PooledObject

zombie.Lua.LuaEventManager.QueuedEvent

All Implemented Interfaces:
:   `zombie.util.IPooledObject`

Enclosing class:
:   `LuaEventManager`

---

public static class LuaEventManager.QueuedEvent
extends zombie.util.PooledObject

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ArrayList<Object>`

  `a`

  `zombie.Lua.Event`

  `e`

  `static final zombie.util.Pool<LuaEventManager.QueuedEvent>`

  `EventPool`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `QueuedEvent()`
* Method Summary
  --------------

  ### Methods inherited from class zombie.util.PooledObject

  `getPoolReference, isFree, release, setFree, setPool`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.util.IPooledObject

  `onReleased`

* Field Details
  -------------

  + ### EventPool

    public static final zombie.util.Pool<[LuaEventManager.QueuedEvent](LuaEventManager.QueuedEvent.html "class in zombie.Lua")> EventPool
  + ### e

    public zombie.Lua.Event e
  + ### a

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> a
* Constructor Details
  -------------------

  + ### QueuedEvent

    public QueuedEvent()