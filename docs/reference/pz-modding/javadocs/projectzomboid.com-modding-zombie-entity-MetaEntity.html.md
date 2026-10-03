[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [MetaEntity](MetaEntity.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [entityNetId](#entityNetId)
   3. [originalEntityType](#originalEntityType)
   4. [x](#x)
   5. [y](#y)
   6. [z](#z)
   7. [isOutsideCached](#isOutsideCached)
   8. [scheduleForReleaseToPool](#scheduleForReleaseToPool)
6. [Constructor Details](#constructor-detail)
   1. [MetaEntity()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [alloc(GameEntity)](#alloc(zombie.entity.GameEntity))
   2. [alloc()](#alloc())
   3. [release(MetaEntity)](#release(zombie.entity.MetaEntity))
   4. [saveMetaEntity(ByteBuffer)](#saveMetaEntity(java.nio.ByteBuffer))
   5. [loadMetaEntity(ByteBuffer, int)](#loadMetaEntity(java.nio.ByteBuffer,int))
   6. [getGameEntityType()](#getGameEntityType())
   7. [getOriginalGameEntityType()](#getOriginalGameEntityType())
   8. [isEntityValid()](#isEntityValid())
   9. [getSquare()](#getSquare())
   10. [getEntityNetID()](#getEntityNetID())
   11. [getX()](#getX())
   12. [getY()](#getY())
   13. [getZ()](#getZ())
   14. [isMeta()](#isMeta())
   15. [isOutside()](#isOutside())
   16. [isUsingPlayer(IsoPlayer)](#isUsingPlayer(zombie.characters.IsoPlayer))
   17. [getUsingPlayer()](#getUsingPlayer())
   18. [setUsingPlayer(IsoPlayer)](#setUsingPlayer(zombie.characters.IsoPlayer))
   19. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MetaEntity
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](GameEntity.html "class in zombie.entity")

zombie.entity.MetaEntity

---

public class MetaEntity
extends [GameEntity](GameEntity.html "class in zombie.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private long`

  `entityNetId`

  `private boolean`

  `isOutsideCached`

  `private GameEntityType`

  `originalEntityType`

  `private static final ConcurrentLinkedQueue<MetaEntity>`

  `pool`

  `(package private) boolean`

  `scheduleForReleaseToPool`

  `private float`

  `x`

  `private float`

  `y`

  `private float`

  `z`

  ### Fields inherited from class [GameEntity](GameEntity.html#field-summary "class in zombie.entity")

  `addedToEngine, addedToEntityManager, DEFAULT_ENTITY_DISPLAY_NAME, removingFromEngine, scheduledDelayedAddToEngine, scheduledForBucketUpdate, scheduledForEngineRemoval`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `MetaEntity()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) static MetaEntity`

  `alloc()`

  `(package private) static MetaEntity`

  `alloc(GameEntity entity)`

  `long`

  `getEntityNetID()`

  `GameEntityType`

  `getGameEntityType()`

  `GameEntityType`

  `getOriginalGameEntityType()`

  `IsoGridSquare`

  `getSquare()`

  `IsoPlayer`

  `getUsingPlayer()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `boolean`

  `isEntityValid()`

  `boolean`

  `isMeta()`

  `boolean`

  `isOutside()`

  `boolean`

  `isUsingPlayer(IsoPlayer target)`

  `final void`

  `loadMetaEntity(ByteBuffer input,
  int worldVersion)`

  `(package private) static void`

  `release(MetaEntity metaEntity)`

  `void`

  `reset()`

  `final void`

  `saveMetaEntity(ByteBuffer output)`

  `void`

  `setUsingPlayer(IsoPlayer player)`

  ### Methods inherited from class [GameEntity](GameEntity.html#method-summary "class in zombie.entity")

  `addComponent, addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getBucketBits, getComponent, getComponentAny, getComponentBits, getComponentForIndex, getComponentFromID, getComponentOperationHandler, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, releaseComponent, releaseComponent, removeComponent, removeComponent, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setComponentOperationHandler`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private static final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<[MetaEntity](MetaEntity.html "class in zombie.entity")> pool
  + ### entityNetId

    private long entityNetId
  + ### originalEntityType

    private [GameEntityType](GameEntityType.html "enum class in zombie.entity") originalEntityType
  + ### x

    private float x
  + ### y

    private float y
  + ### z

    private float z
  + ### isOutsideCached

    private boolean isOutsideCached
  + ### scheduleForReleaseToPool

    boolean scheduleForReleaseToPool
* Constructor Details
  -------------------

  + ### MetaEntity

    private MetaEntity()
* Method Details
  --------------

  + ### alloc

    static [MetaEntity](MetaEntity.html "class in zombie.entity") alloc([GameEntity](GameEntity.html "class in zombie.entity") entity)
  + ### alloc

    static [MetaEntity](MetaEntity.html "class in zombie.entity") alloc()
  + ### release

    static void release([MetaEntity](MetaEntity.html "class in zombie.entity") metaEntity)
  + ### saveMetaEntity

    public final void saveMetaEntity([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadMetaEntity

    public final void loadMetaEntity([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getGameEntityType

    public [GameEntityType](GameEntityType.html "enum class in zombie.entity") getGameEntityType()

    Specified by:
    :   `getGameEntityType` in class `GameEntity`
  + ### getOriginalGameEntityType

    public [GameEntityType](GameEntityType.html "enum class in zombie.entity") getOriginalGameEntityType()
  + ### isEntityValid

    public boolean isEntityValid()

    Specified by:
    :   `isEntityValid` in class `GameEntity`
  + ### getSquare

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquare()

    Specified by:
    :   `getSquare` in class `GameEntity`
  + ### getEntityNetID

    public long getEntityNetID()

    Specified by:
    :   `getEntityNetID` in class `GameEntity`
  + ### getX

    public float getX()

    Specified by:
    :   `getX` in class `GameEntity`
  + ### getY

    public float getY()

    Specified by:
    :   `getY` in class `GameEntity`
  + ### getZ

    public float getZ()

    Specified by:
    :   `getZ` in class `GameEntity`
  + ### isMeta

    public boolean isMeta()

    Overrides:
    :   `isMeta` in class `GameEntity`
  + ### isOutside

    public boolean isOutside()

    Overrides:
    :   `isOutside` in class `GameEntity`
  + ### isUsingPlayer

    public boolean isUsingPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") target)

    Overrides:
    :   `isUsingPlayer` in class `GameEntity`
  + ### getUsingPlayer

    public [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getUsingPlayer()

    Overrides:
    :   `getUsingPlayer` in class `GameEntity`
  + ### setUsingPlayer

    public void setUsingPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)

    Overrides:
    :   `setUsingPlayer` in class `GameEntity`
  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `GameEntity`