[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [EntityBucket](EntityBucket.html)
3. [CustomBucket](EntityBucket.CustomBucket.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [validator](#validator)
7. [Constructor Details](#constructor-detail)
   1. [CustomBucket(int, EntityBucket.EntityValidator)](#%3Cinit%3E(int,zombie.entity.EntityBucket.EntityValidator))
8. [Method Details](#method-detail)
   1. [acceptsEntity(GameEntity)](#acceptsEntity(zombie.entity.GameEntity))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class EntityBucket.CustomBucket
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.EntityBucket](EntityBucket.html "class in zombie.entity")

zombie.entity.EntityBucket.CustomBucket

Enclosing class:
:   `EntityBucket`

---

protected static class EntityBucket.CustomBucket
extends [EntityBucket](EntityBucket.html "class in zombie.entity")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [EntityBucket](EntityBucket.html#nested-class-summary "class in zombie.entity")

  `EntityBucket.CustomBucket, EntityBucket.EntityValidator, EntityBucket.FamilyBucket, EntityBucket.InventoryItemBucket, EntityBucket.IsoObjectBucket, EntityBucket.RendererBucket, EntityBucket.VehiclePartBucket`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final EntityBucket.EntityValidator`

  `validator`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `CustomBucket(int index,
  EntityBucket.EntityValidator validator)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected final boolean`

  `acceptsEntity(GameEntity entity)`

  ### Methods inherited from class [EntityBucket](EntityBucket.html#method-summary "class in zombie.entity")

  `addListener, getEntities, getIndex, removeListener, setVerbose, updateMembership`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### validator

    private final [EntityBucket.EntityValidator](EntityBucket.EntityValidator.html "interface in zombie.entity") validator
* Constructor Details
  -------------------

  + ### CustomBucket

    protected CustomBucket(int index,
    [EntityBucket.EntityValidator](EntityBucket.EntityValidator.html "interface in zombie.entity") validator)
* Method Details
  --------------

  + ### acceptsEntity

    protected final boolean acceptsEntity([GameEntity](GameEntity.html "class in zombie.entity") entity)

    Specified by:
    :   `acceptsEntity` in class `EntityBucket`