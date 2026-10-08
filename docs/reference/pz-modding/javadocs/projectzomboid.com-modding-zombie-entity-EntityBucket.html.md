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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [entities](#entities)
   2. [immutableEntities](#immutableEntities)
   3. [listeners](#listeners)
   4. [listenerSet](#listenerSet)
   5. [listenerComparator](#listenerComparator)
   6. [index](#index)
   7. [verbose](#verbose)
7. [Constructor Details](#constructor-detail)
   1. [EntityBucket(int)](#%3Cinit%3E(int))
8. [Method Details](#method-detail)
   1. [getIndex()](#getIndex())
   2. [getEntities()](#getEntities())
   3. [setVerbose(boolean)](#setVerbose(boolean))
   4. [acceptsEntity(GameEntity)](#acceptsEntity(zombie.entity.GameEntity))
   5. [updateMembership(GameEntity)](#updateMembership(zombie.entity.GameEntity))
   6. [addListener(int, IBucketListener)](#addListener(int,zombie.entity.IBucketListener))
   7. [removeListener(IBucketListener)](#removeListener(zombie.entity.IBucketListener))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class EntityBucket
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.EntityBucket

Direct Known Subclasses:
:   `EntityBucket.CustomBucket, EntityBucket.FamilyBucket, EntityBucket.InventoryItemBucket, EntityBucket.IsoObjectBucket, EntityBucket.RendererBucket, EntityBucket.VehiclePartBucket`

---

public abstract class EntityBucket
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

A bucket can store entities with certain properties.
The conditions for storing an entity can be defined in acceptsEntity().
Buckets and entity membership are maintained by the engine.
Default buckets are: Updaters, Renderers and (Component) Families.
Of the above one unique bucket will exist that can be used many times in various systems.
Bucket listeners may added to buckets that get notified when entities are added/removed from bucket.

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `EntityBucket.BucketListenerComparator`

  `private static class`

  `EntityBucket.BucketListenerData`

  `protected static class`

  `EntityBucket.CustomBucket`

  `static interface`

  `EntityBucket.EntityValidator`

  `protected static class`

  `EntityBucket.FamilyBucket`

  `protected static class`

  `EntityBucket.InventoryItemBucket`

  `protected static class`

  `EntityBucket.IsoObjectBucket`

  `protected static class`

  `EntityBucket.RendererBucket`

  `protected static class`

  `EntityBucket.VehiclePartBucket`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Array<GameEntity>`

  `entities`

  `private final ImmutableArray<GameEntity>`

  `immutableEntities`

  `private final int`

  `index`

  `private final EntityBucket.BucketListenerComparator`

  `listenerComparator`

  `private final Array<EntityBucket.BucketListenerData>`

  `listeners`

  `private final zombie.entity.util.ObjectSet<zombie.entity.IBucketListener>`

  `listenerSet`

  `private boolean`

  `verbose`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `EntityBucket(int index)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected abstract boolean`

  `acceptsEntity(GameEntity entity)`

  `final void`

  `addListener(int priority,
  zombie.entity.IBucketListener listener)`

  `final ImmutableArray<GameEntity>`

  `getEntities()`

  `final int`

  `getIndex()`

  `final void`

  `removeListener(zombie.entity.IBucketListener listener)`

  `final void`

  `setVerbose(boolean b)`

  `(package private) final void`

  `updateMembership(GameEntity entity)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### entities

    private final [Array](util/Array.html "class in zombie.entity.util")<[GameEntity](GameEntity.html "class in zombie.entity")> entities
  + ### immutableEntities

    private final [ImmutableArray](util/ImmutableArray.html "class in zombie.entity.util")<[GameEntity](GameEntity.html "class in zombie.entity")> immutableEntities
  + ### listeners

    private final [Array](util/Array.html "class in zombie.entity.util")<[EntityBucket.BucketListenerData](EntityBucket.BucketListenerData.html "class in zombie.entity")> listeners
  + ### listenerSet

    private final zombie.entity.util.ObjectSet<zombie.entity.IBucketListener> listenerSet
  + ### listenerComparator

    private final [EntityBucket.BucketListenerComparator](EntityBucket.BucketListenerComparator.html "class in zombie.entity") listenerComparator
  + ### index

    private final int index
  + ### verbose

    private boolean verbose
* Constructor Details
  -------------------

  + ### EntityBucket

    private EntityBucket(int index)
* Method Details
  --------------

  + ### getIndex

    public final int getIndex()
  + ### getEntities

    public final [ImmutableArray](util/ImmutableArray.html "class in zombie.entity.util")<[GameEntity](GameEntity.html "class in zombie.entity")> getEntities()
  + ### setVerbose

    public final void setVerbose(boolean b)
  + ### acceptsEntity

    protected abstract boolean acceptsEntity([GameEntity](GameEntity.html "class in zombie.entity") entity)
  + ### updateMembership

    final void updateMembership([GameEntity](GameEntity.html "class in zombie.entity") entity)
  + ### addListener

    public final void addListener(int priority,
    zombie.entity.IBucketListener listener)
  + ### removeListener

    public final void removeListener(zombie.entity.IBucketListener listener)