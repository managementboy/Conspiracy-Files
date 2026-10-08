[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.events](package-summary.html)
2. [ComponentEvent](ComponentEvent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [eventType](#eventType)
   3. [sender](#sender)
6. [Constructor Details](#constructor-detail)
   1. [ComponentEvent()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Alloc(ComponentEventType, Component)](#Alloc(zombie.entity.events.ComponentEventType,zombie.entity.Component))
   2. [getEventType()](#getEventType())
   3. [getSender()](#getSender())
   4. [reset()](#reset())
   5. [release()](#release())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ComponentEvent
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.events.ComponentEvent

---

public class ComponentEvent
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ComponentEventType`

  `eventType`

  `protected static final ConcurrentLinkedDeque<ComponentEvent>`

  `pool`

  `private Component`

  `sender`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ComponentEvent()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ComponentEvent`

  `Alloc(ComponentEventType type,
  Component sender)`

  `ComponentEventType`

  `getEventType()`

  `Component`

  `getSender()`

  `void`

  `release()`

  `protected void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    protected static final [ConcurrentLinkedDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedDeque.html "class or interface in java.util.concurrent")<[ComponentEvent](ComponentEvent.html "class in zombie.entity.events")> pool
  + ### eventType

    private [ComponentEventType](ComponentEventType.html "enum class in zombie.entity.events") eventType
  + ### sender

    private [Component](../Component.html "class in zombie.entity") sender
* Constructor Details
  -------------------

  + ### ComponentEvent

    private ComponentEvent()
* Method Details
  --------------

  + ### Alloc

    public static [ComponentEvent](ComponentEvent.html "class in zombie.entity.events") Alloc([ComponentEventType](ComponentEventType.html "enum class in zombie.entity.events") type,
    [Component](../Component.html "class in zombie.entity") sender)
  + ### getEventType

    public [ComponentEventType](ComponentEventType.html "enum class in zombie.entity.events") getEventType()
  + ### getSender

    public [Component](../Component.html "class in zombie.entity") getSender()
  + ### reset

    protected void reset()
  + ### release

    public void release()