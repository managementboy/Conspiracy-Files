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
3. [FamilyBucket](EntityBucket.FamilyBucket.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [family](#family)
7. [Constructor Details](#constructor-detail)
   1. [FamilyBucket(int, Family)](#%3Cinit%3E(int,zombie.entity.Family))
8. [Method Details](#method-detail)
   1. [acceptsEntity(GameEntity)](#acceptsEntity(zombie.entity.GameEntity))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class EntityBucket.FamilyBucket
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.EntityBucket](EntityBucket.html "class in zombie.entity")

zombie.entity.EntityBucket.FamilyBucket

Enclosing class:
:   `EntityBucket`

---

protected static class EntityBucket.FamilyBucket
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

  `private final Family`

  `family`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `FamilyBucket(int index,
  Family family)`
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

  + ### family

    private final [Family](Family.html "class in zombie.entity") family
* Constructor Details
  -------------------

  + ### FamilyBucket

    protected FamilyBucket(int index,
    [Family](Family.html "class in zombie.entity") family)
* Method Details
  --------------

  + ### acceptsEntity

    protected final boolean acceptsEntity([GameEntity](GameEntity.html "class in zombie.entity") entity)

    Specified by:
    :   `acceptsEntity` in class `EntityBucket`