[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [GameEntity](GameEntity.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [DEFAULT\_ENTITY\_DISPLAY\_NAME](#DEFAULT_ENTITY_DISPLAY_NAME)
   2. [components](#components)
   3. [addedToWorldOrEquipped](#addedToWorldOrEquipped)
   4. [addedToEntityManager](#addedToEntityManager)
   5. [dummyBits](#dummyBits)
   6. [addedToEngine](#addedToEngine)
   7. [removingFromEngine](#removingFromEngine)
   8. [scheduledDelayedAddToEngine](#scheduledDelayedAddToEngine)
   9. [scheduledForEngineRemoval](#scheduledForEngineRemoval)
   10. [scheduledForBucketUpdate](#scheduledForBucketUpdate)
   11. [usingPlayer](#usingPlayer)
   12. [IOverbose](#IOverbose)
6. [Constructor Details](#constructor-detail)
   1. [GameEntity()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getDefaultEntityDisplayName()](#getDefaultEntityDisplayName())
   2. [getGameEntityType()](#getGameEntityType())
   3. [getSquare()](#getSquare())
   4. [getEntityNetID()](#getEntityNetID())
   5. [getX()](#getX())
   6. [getY()](#getY())
   7. [getZ()](#getZ())
   8. [getXi()](#getXi())
   9. [getYi()](#getYi())
   10. [getZi()](#getZi())
   11. [isEntityValid()](#isEntityValid())
   12. [isValidEngineEntity()](#isValidEngineEntity())
   13. [isMeta()](#isMeta())
   14. [isOutside()](#isOutside())
   15. [getEntityDisplayName()](#getEntityDisplayName())
   16. [getEntityFullTypeDebug()](#getEntityFullTypeDebug())
   17. [getEntityScript()](#getEntityScript())
   18. [getExceptionCompatibleString()](#getExceptionCompatibleString())
   19. [attrib()](#attrib())
   20. [getAttributes()](#getAttributes())
   21. [getFluidContainer()](#getFluidContainer())
   22. [getDurabilityComponent()](#getDurabilityComponent())
   23. [getSpriteConfig()](#getSpriteConfig())
   24. [isAddedToEngine()](#isAddedToEngine())
   25. [isRemovingFromEngine()](#isRemovingFromEngine())
   26. [isScheduledForEngineRemoval()](#isScheduledForEngineRemoval())
   27. [isScheduledForBucketUpdate()](#isScheduledForBucketUpdate())
   28. [getBucketBits()](#getBucketBits())
   29. [getComponentBits()](#getComponentBits())
   30. [hasRenderers()](#hasRenderers())
   31. [getComponentOperationHandler()](#getComponentOperationHandler())
   32. [setComponentOperationHandler(ComponentOperationHandler)](#setComponentOperationHandler(zombie.entity.ComponentOperationHandler))
   33. [ensureComponents()](#ensureComponents())
   34. [hasComponents()](#hasComponents())
   35. [addComponent(Component)](#addComponent(zombie.entity.Component))
   36. [releaseComponent(ComponentType)](#releaseComponent(zombie.entity.ComponentType))
   37. [releaseComponent(Component)](#releaseComponent(zombie.entity.Component))
   38. [removeComponent(ComponentType)](#removeComponent(zombie.entity.ComponentType))
   39. [removeComponent(Component)](#removeComponent(zombie.entity.Component))
   40. [hasComponent(ComponentType)](#hasComponent(zombie.entity.ComponentType))
   41. [hasComponentAny(ComponentType...)](#hasComponentAny(zombie.entity.ComponentType...))
   42. [componentSize()](#componentSize())
   43. [getComponentForIndex(int)](#getComponentForIndex(int))
   44. [getComponent(ComponentType)](#getComponent(zombie.entity.ComponentType))
   45. [getComponentAny(ComponentType...)](#getComponentAny(zombie.entity.ComponentType...))
   46. [getComponentFromID(short)](#getComponentFromID(short))
   47. [containsComponent(Component)](#containsComponent(zombie.entity.Component))
   48. [sendComponentEvent(Component, ComponentEventType)](#sendComponentEvent(zombie.entity.Component,zombie.entity.events.ComponentEventType))
   49. [sendComponentEvent(Component, ComponentEvent)](#sendComponentEvent(zombie.entity.Component,zombie.entity.events.ComponentEvent))
   50. [sendEntityEvent(EntityEventType)](#sendEntityEvent(zombie.entity.events.EntityEventType))
   51. [sendEntityEvent(EntityEvent)](#sendEntityEvent(zombie.entity.events.EntityEvent))
   52. [connectComponents()](#connectComponents())
   53. [onFirstCreation()](#onFirstCreation())
   54. [reset()](#reset())
   55. [onEquip()](#onEquip())
   56. [onEquip(boolean)](#onEquip(boolean))
   57. [onUnEquip()](#onUnEquip())
   58. [addToWorld()](#addToWorld())
   59. [removeFromWorld()](#removeFromWorld())
   60. [removeFromWorld(boolean)](#removeFromWorld(boolean))
   61. [renderlast()](#renderlast())
   62. [renderlastComponents()](#renderlastComponents())
   63. [requiresEntitySave()](#requiresEntitySave())
   64. [saveEntity(ByteBuffer)](#saveEntity(java.nio.ByteBuffer))
   65. [loadEntity(ByteBuffer, int)](#loadEntity(java.nio.ByteBuffer,int))
   66. [loadEntity(ByteBuffer, int, List)](#loadEntity(java.nio.ByteBuffer,int,java.util.List))
   67. [isUsingPlayer(IsoPlayer)](#isUsingPlayer(zombie.characters.IsoPlayer))
   68. [getUsingPlayer()](#getUsingPlayer())
   69. [setUsingPlayer(IsoPlayer)](#setUsingPlayer(zombie.characters.IsoPlayer))
   70. [sendServerEntityPacketTo(IsoPlayer, EntityPacketData)](#sendServerEntityPacketTo(zombie.characters.IsoPlayer,zombie.entity.network.EntityPacketData))
   71. [sendClientEntityPacket(EntityPacketData)](#sendClientEntityPacket(zombie.entity.network.EntityPacketData))
   72. [sendServerEntityPacket(EntityPacketData, UdpConnection)](#sendServerEntityPacket(zombie.entity.network.EntityPacketData,zombie.core.raknet.UdpConnection))
   73. [onReceiveEntityPacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceiveEntityPacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   74. [sendUpdateUsingPlayer()](#sendUpdateUsingPlayer())
   75. [receiveUpdateUsingPlayer(ByteBufferReader, IConnection)](#receiveUpdateUsingPlayer(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   76. [sendSyncEntity(UdpConnection)](#sendSyncEntity(zombie.core.raknet.UdpConnection))
   77. [sendRequestSyncGameEntity()](#sendRequestSyncGameEntity())
   78. [receiveSyncEntity(ByteBufferReader, IConnection)](#receiveSyncEntity(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   79. [receiveRequestSyncGameEntity(ByteBufferReader, IConnection)](#receiveRequestSyncGameEntity(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   80. [onFluidContainerUpdate()](#onFluidContainerUpdate())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameEntity
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.GameEntity

Direct Known Subclasses:
:   `InventoryItem, IsoObject, MetaEntity, VehiclePart`

---

public abstract class GameEntity
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) boolean`

  `addedToEngine`

  `(package private) boolean`

  `addedToEntityManager`

  `private boolean`

  `addedToWorldOrEquipped`

  `private zombie.entity.ComponentContainer`

  `components`

  `static final String`

  `DEFAULT_ENTITY_DISPLAY_NAME`

  `private static final BitSet`

  `dummyBits`

  `private static final boolean`

  `IOverbose`

  `(package private) boolean`

  `removingFromEngine`

  `(package private) boolean`

  `scheduledDelayedAddToEngine`

  `(package private) boolean`

  `scheduledForBucketUpdate`

  `(package private) boolean`

  `scheduledForEngineRemoval`

  `private IsoPlayer`

  `usingPlayer`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameEntity()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) final boolean`

  `addComponent(Component component)`

  Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")

  `void`

  `addToWorld()`

  `final AttributeContainer`

  `attrib()`

  `final int`

  `componentSize()`

  `protected final void`

  `connectComponents()`

  `final boolean`

  `containsComponent(Component component)`

  `private void`

  `ensureComponents()`

  `final AttributeContainer`

  `getAttributes()`

  `(package private) BitSet`

  `getBucketBits()`

  `final <T extends Component>  
  T`

  `getComponent(ComponentType type)`

  `final <T extends Component>  
  T`

  `getComponentAny(ComponentType... types)`

  `(package private) BitSet`

  `getComponentBits()`

  `final Component`

  `getComponentForIndex(int index)`

  `final Component`

  `getComponentFromID(short id)`

  `(package private) zombie.entity.ComponentOperationHandler`

  `getComponentOperationHandler()`

  `static String`

  `getDefaultEntityDisplayName()`

  `final zombie.entity.components.combat.Durability`

  `getDurabilityComponent()`

  `String`

  `getEntityDisplayName()`

  `String`

  `getEntityFullTypeDebug()`

  `abstract long`

  `getEntityNetID()`

  `GameEntityScript`

  `getEntityScript()`

  `final String`

  `getExceptionCompatibleString()`

  `final FluidContainer`

  `getFluidContainer()`

  `abstract GameEntityType`

  `getGameEntityType()`

  `final SpriteConfig`

  `getSpriteConfig()`

  `abstract IsoGridSquare`

  `getSquare()`

  `IsoPlayer`

  `getUsingPlayer()`

  `abstract float`

  `getX()`

  `final int`

  `getXi()`

  `abstract float`

  `getY()`

  `final int`

  `getYi()`

  `abstract float`

  `getZ()`

  `final int`

  `getZi()`

  `final boolean`

  `hasComponent(ComponentType type)`

  `final boolean`

  `hasComponentAny(ComponentType... types)`

  `final boolean`

  `hasComponents()`

  `boolean`

  `hasRenderers()`

  `final boolean`

  `isAddedToEngine()`

  `abstract boolean`

  `isEntityValid()`

  `boolean`

  `isMeta()`

  `boolean`

  `isOutside()`

  `final boolean`

  `isRemovingFromEngine()`

  `final boolean`

  `isScheduledForBucketUpdate()`

  `final boolean`

  `isScheduledForEngineRemoval()`

  `boolean`

  `isUsingPlayer(IsoPlayer target)`

  `boolean`

  `isValidEngineEntity()`

  `final void`

  `loadEntity(ByteBuffer input,
  int worldVersion)`

  `final void`

  `loadEntity(ByteBuffer input,
  int worldVersion,
  List<Component> loaded)`

  `void`

  `onEquip()`

  `void`

  `onEquip(boolean register)`

  `protected final void`

  `onFirstCreation()`

  Called when entity is created for the first time.

  `void`

  `onFluidContainerUpdate()`

  `protected final boolean`

  `onReceiveEntityPacket(zombie.core.network.ByteBufferReader input,
  zombie.entity.network.EntityPacketType type,
  zombie.network.IConnection senderConnection)`

  `void`

  `onUnEquip()`

  `protected final void`

  `receiveRequestSyncGameEntity(zombie.core.network.ByteBufferReader input,
  zombie.network.IConnection senderConnection)`

  `protected final void`

  `receiveSyncEntity(zombie.core.network.ByteBufferReader input,
  zombie.network.IConnection senderConnection)`

  `protected final void`

  `receiveUpdateUsingPlayer(zombie.core.network.ByteBufferReader input,
  zombie.network.IConnection senderConnection)`

  `(package private) final boolean`

  `releaseComponent(Component component)`

  Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")
  Removes and releases component to pool.

  `(package private) final boolean`

  `releaseComponent(ComponentType componentType)`

  Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")
  Removes and releases component to pool.

  `(package private) final Component`

  `removeComponent(Component component)`

  Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")
  Removes and returns the component if found, does not release component to pool.

  `(package private) final Component`

  `removeComponent(ComponentType componentType)`

  Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")
  Removes and returns the component if found, does not release component to pool.

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `final void`

  `removeFromWorld(boolean offloadEntityToMeta)`

  Remove Object from world.

  `void`

  `renderlast()`

  `void`

  `renderlastComponents()`

  `final boolean`

  `requiresEntitySave()`

  `void`

  `reset()`

  `final void`

  `saveEntity(ByteBuffer output)`

  `protected final void`

  `sendClientEntityPacket(zombie.entity.network.EntityPacketData data)`

  `protected final void`

  `sendComponentEvent(Component sender,
  ComponentEvent event)`

  `protected final void`

  `sendComponentEvent(Component sender,
  ComponentEventType eventType)`

  `protected final void`

  `sendEntityEvent(EntityEvent event)`

  `protected final void`

  `sendEntityEvent(EntityEventType eventType)`

  `final void`

  `sendRequestSyncGameEntity()`

  `protected final void`

  `sendServerEntityPacket(zombie.entity.network.EntityPacketData data,
  zombie.core.raknet.UdpConnection ignoreConnection)`

  `protected final void`

  `sendServerEntityPacketTo(IsoPlayer player,
  zombie.entity.network.EntityPacketData data)`

  `final void`

  `sendSyncEntity(zombie.core.raknet.UdpConnection ignoreConnection)`

  `protected final void`

  `sendUpdateUsingPlayer()`

  `(package private) void`

  `setComponentOperationHandler(zombie.entity.ComponentOperationHandler handler)`

  `void`

  `setUsingPlayer(IsoPlayer player)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DEFAULT\_ENTITY\_DISPLAY\_NAME

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") DEFAULT\_ENTITY\_DISPLAY\_NAME

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.entity.GameEntity.DEFAULT_ENTITY_DISPLAY_NAME)
  + ### components

    private zombie.entity.ComponentContainer components
  + ### addedToWorldOrEquipped

    private boolean addedToWorldOrEquipped
  + ### addedToEntityManager

    boolean addedToEntityManager
  + ### dummyBits

    private static final [BitSet](util/BitSet.html "class in zombie.entity.util") dummyBits
  + ### addedToEngine

    boolean addedToEngine
  + ### removingFromEngine

    boolean removingFromEngine
  + ### scheduledDelayedAddToEngine

    boolean scheduledDelayedAddToEngine
  + ### scheduledForEngineRemoval

    boolean scheduledForEngineRemoval
  + ### scheduledForBucketUpdate

    boolean scheduledForBucketUpdate
  + ### usingPlayer

    private [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") usingPlayer
  + ### IOverbose

    private static final boolean IOverbose

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.entity.GameEntity.IOverbose)
* Constructor Details
  -------------------

  + ### GameEntity

    public GameEntity()
* Method Details
  --------------

  + ### getDefaultEntityDisplayName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDefaultEntityDisplayName()
  + ### getGameEntityType

    public abstract [GameEntityType](GameEntityType.html "enum class in zombie.entity") getGameEntityType()
  + ### getSquare

    public abstract [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquare()
  + ### getEntityNetID

    public abstract long getEntityNetID()
  + ### getX

    public abstract float getX()
  + ### getY

    public abstract float getY()
  + ### getZ

    public abstract float getZ()
  + ### getXi

    public final int getXi()
  + ### getYi

    public final int getYi()
  + ### getZi

    public final int getZi()
  + ### isEntityValid

    public abstract boolean isEntityValid()
  + ### isValidEngineEntity

    public boolean isValidEngineEntity()
  + ### isMeta

    public boolean isMeta()
  + ### isOutside

    public boolean isOutside()
  + ### getEntityDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEntityDisplayName()
  + ### getEntityFullTypeDebug

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEntityFullTypeDebug()
  + ### getEntityScript

    public [GameEntityScript](../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") getEntityScript()
  + ### getExceptionCompatibleString

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getExceptionCompatibleString()
  + ### attrib

    public final [AttributeContainer](components/attributes/AttributeContainer.html "class in zombie.entity.components.attributes") attrib()
  + ### getAttributes

    public final [AttributeContainer](components/attributes/AttributeContainer.html "class in zombie.entity.components.attributes") getAttributes()
  + ### getFluidContainer

    public final [FluidContainer](components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") getFluidContainer()
  + ### getDurabilityComponent

    public final zombie.entity.components.combat.Durability getDurabilityComponent()
  + ### getSpriteConfig

    public final [SpriteConfig](components/spriteconfig/SpriteConfig.html "class in zombie.entity.components.spriteconfig") getSpriteConfig()
  + ### isAddedToEngine

    public final boolean isAddedToEngine()
  + ### isRemovingFromEngine

    public final boolean isRemovingFromEngine()
  + ### isScheduledForEngineRemoval

    public final boolean isScheduledForEngineRemoval()
  + ### isScheduledForBucketUpdate

    public final boolean isScheduledForBucketUpdate()
  + ### getBucketBits

    [BitSet](util/BitSet.html "class in zombie.entity.util") getBucketBits()
  + ### getComponentBits

    [BitSet](util/BitSet.html "class in zombie.entity.util") getComponentBits()
  + ### hasRenderers

    public boolean hasRenderers()
  + ### getComponentOperationHandler

    zombie.entity.ComponentOperationHandler getComponentOperationHandler()
  + ### setComponentOperationHandler

    void setComponentOperationHandler(zombie.entity.ComponentOperationHandler handler)
  + ### ensureComponents

    private void ensureComponents()
  + ### hasComponents

    public final boolean hasComponents()
  + ### addComponent

    final boolean addComponent([Component](Component.html "class in zombie.entity") component)

    Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")
  + ### releaseComponent

    final boolean releaseComponent([ComponentType](ComponentType.html "enum class in zombie.entity") componentType)

    Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")
    Removes and releases component to pool.
  + ### releaseComponent

    final boolean releaseComponent([Component](Component.html "class in zombie.entity") component)

    Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")
    Removes and releases component to pool.
  + ### removeComponent

    final [Component](Component.html "class in zombie.entity") removeComponent([ComponentType](ComponentType.html "enum class in zombie.entity") componentType)

    Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")
    Removes and returns the component if found, does not release component to pool.
  + ### removeComponent

    final [Component](Component.html "class in zombie.entity") removeComponent([Component](Component.html "class in zombie.entity") component)

    Package-internal function, Adding or Removing components should be done via [`GameEntityFactory`](GameEntityFactory.html "class in zombie.entity")
    Removes and returns the component if found, does not release component to pool.
  + ### hasComponent

    public final boolean hasComponent([ComponentType](ComponentType.html "enum class in zombie.entity") type)
  + ### hasComponentAny

    public final boolean hasComponentAny([ComponentType](ComponentType.html "enum class in zombie.entity")... types)
  + ### componentSize

    public final int componentSize()
  + ### getComponentForIndex

    public final [Component](Component.html "class in zombie.entity") getComponentForIndex(int index)
  + ### getComponent

    public final <T extends [Component](Component.html "class in zombie.entity")> T getComponent([ComponentType](ComponentType.html "enum class in zombie.entity") type)
  + ### getComponentAny

    public final <T extends [Component](Component.html "class in zombie.entity")> T getComponentAny([ComponentType](ComponentType.html "enum class in zombie.entity")... types)
  + ### getComponentFromID

    public final [Component](Component.html "class in zombie.entity") getComponentFromID(short id)
  + ### containsComponent

    public final boolean containsComponent([Component](Component.html "class in zombie.entity") component)
  + ### sendComponentEvent

    protected final void sendComponentEvent([Component](Component.html "class in zombie.entity") sender,
    [ComponentEventType](events/ComponentEventType.html "enum class in zombie.entity.events") eventType)
  + ### sendComponentEvent

    protected final void sendComponentEvent([Component](Component.html "class in zombie.entity") sender,
    [ComponentEvent](events/ComponentEvent.html "class in zombie.entity.events") event)
  + ### sendEntityEvent

    protected final void sendEntityEvent([EntityEventType](events/EntityEventType.html "enum class in zombie.entity.events") eventType)
  + ### sendEntityEvent

    protected final void sendEntityEvent([EntityEvent](events/EntityEvent.html "class in zombie.entity.events") event)
  + ### connectComponents

    protected final void connectComponents()
  + ### onFirstCreation

    protected final void onFirstCreation()

    Called when entity is created for the first time.
    Can be used to randomize stuff in the components (for example storage contents, or certain stats)
  + ### reset

    public void reset()
  + ### onEquip

    public void onEquip()
  + ### onEquip

    public void onEquip(boolean register)
  + ### onUnEquip

    public void onUnEquip()
  + ### addToWorld

    public void addToWorld()
  + ### removeFromWorld

    public void removeFromWorld()

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.
  + ### removeFromWorld

    public final void removeFromWorld(boolean offloadEntityToMeta)

    Remove Object from world.
    If called with `offloadEntityToMeta = TRUE` the entity will be checked
    for being offloaded to meta.
    This is intended to keep components alive that should keep running when they offload
    from the current scene.
    Also see `GameEntityManager.UnregisterEntity`
  + ### renderlast

    public void renderlast()
  + ### renderlastComponents

    public void renderlastComponents()
  + ### requiresEntitySave

    public final boolean requiresEntitySave()
  + ### saveEntity

    public final void saveEntity([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadEntity

    public final void loadEntity([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadEntity

    public final void loadEntity([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Component](Component.html "class in zombie.entity")> loaded)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### isUsingPlayer

    public boolean isUsingPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") target)
  + ### getUsingPlayer

    public [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getUsingPlayer()
  + ### setUsingPlayer

    public void setUsingPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sendServerEntityPacketTo

    protected final void sendServerEntityPacketTo([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    zombie.entity.network.EntityPacketData data)
  + ### sendClientEntityPacket

    protected final void sendClientEntityPacket(zombie.entity.network.EntityPacketData data)
  + ### sendServerEntityPacket

    protected final void sendServerEntityPacket(zombie.entity.network.EntityPacketData data,
    zombie.core.raknet.UdpConnection ignoreConnection)
  + ### onReceiveEntityPacket

    protected final boolean onReceiveEntityPacket(zombie.core.network.ByteBufferReader input,
    zombie.entity.network.EntityPacketType type,
    zombie.network.IConnection senderConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### sendUpdateUsingPlayer

    protected final void sendUpdateUsingPlayer()
  + ### receiveUpdateUsingPlayer

    protected final void receiveUpdateUsingPlayer(zombie.core.network.ByteBufferReader input,
    zombie.network.IConnection senderConnection)
  + ### sendSyncEntity

    public final void sendSyncEntity(zombie.core.raknet.UdpConnection ignoreConnection)
  + ### sendRequestSyncGameEntity

    public final void sendRequestSyncGameEntity()
  + ### receiveSyncEntity

    protected final void receiveSyncEntity(zombie.core.network.ByteBufferReader input,
    zombie.network.IConnection senderConnection)
  + ### receiveRequestSyncGameEntity

    protected final void receiveRequestSyncGameEntity(zombie.core.network.ByteBufferReader input,
    zombie.network.IConnection senderConnection)
  + ### onFluidContainerUpdate

    public void onFluidContainerUpdate()