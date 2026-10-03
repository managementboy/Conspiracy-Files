[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.events](package-summary.html)
2. [EntityEvent](EntityEvent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [eventType](#eventType)
   3. [entity](#entity)
6. [Constructor Details](#constructor-detail)
   1. [EntityEvent()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Alloc(EntityEventType, GameEntity)](#Alloc(zombie.entity.events.EntityEventType,zombie.entity.GameEntity))
   2. [getEventType()](#getEventType())
   3. [getEntity()](#getEntity())
   4. [reset()](#reset())
   5. [release()](#release())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class EntityEvent
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.events.EntityEvent

---

public class EntityEvent
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private GameEntity`

  `entity`

  `private EntityEventType`

  `eventType`

  `protected static final ConcurrentLinkedDeque<EntityEvent>`

  `pool`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `EntityEvent()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static EntityEvent`

  `Alloc(EntityEventType type,
  GameEntity entity)`

  `GameEntity`

  `getEntity()`

  `EntityEventType`

  `getEventType()`

  `void`

  `release()`

  `protected void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    protected static final [ConcurrentLinkedDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedDeque.html "class or interface in java.util.concurrent")<[EntityEvent](EntityEvent.html "class in zombie.entity.events")> pool
  + ### eventType

    private [EntityEventType](EntityEventType.html "enum class in zombie.entity.events") eventType
  + ### entity

    private [GameEntity](../GameEntity.html "class in zombie.entity") entity
* Constructor Details
  -------------------

  + ### EntityEvent

    private EntityEvent()
* Method Details
  --------------

  + ### Alloc

    public static [EntityEvent](EntityEvent.html "class in zombie.entity.events") Alloc([EntityEventType](EntityEventType.html "enum class in zombie.entity.events") type,
    [GameEntity](../GameEntity.html "class in zombie.entity") entity)
  + ### getEventType

    public [EntityEventType](EntityEventType.html "enum class in zombie.entity.events") getEventType()
  + ### getEntity

    public [GameEntity](../GameEntity.html "class in zombie.entity") getEntity()
  + ### reset

    protected void reset()
  + ### release

    public void release()