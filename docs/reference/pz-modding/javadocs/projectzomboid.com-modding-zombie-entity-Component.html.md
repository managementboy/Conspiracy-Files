[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [Component](Component.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [owner](#owner)
   2. [componentType](#componentType)
6. [Constructor Details](#constructor-detail)
   1. [Component(ComponentType)](#%3Cinit%3E(zombie.entity.ComponentType))
7. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [isRunningInMeta()](#isRunningInMeta())
   3. [isQualifiesForMetaStorage()](#isQualifiesForMetaStorage())
   4. [isAddedToEngine()](#isAddedToEngine())
   5. [getOwner()](#getOwner())
   6. [getGameEntity()](#getGameEntity())
   7. [isUsingPlayer(IsoPlayer)](#isUsingPlayer(zombie.characters.IsoPlayer))
   8. [getUsingPlayer()](#getUsingPlayer())
   9. [getComponentType()](#getComponentType())
   10. [setOwner(GameEntity)](#setOwner(zombie.entity.GameEntity))
   11. [getComponent(ComponentType)](#getComponent(zombie.entity.ComponentType))
   12. [isValid()](#isValid())
   13. [DoTooltip(ObjectTooltip)](#DoTooltip(zombie.ui.ObjectTooltip))
   14. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   15. [isRenderLast()](#isRenderLast())
   16. [getRenderLastPriority()](#getRenderLastPriority())
   17. [dumpContentsInSquare()](#dumpContentsInSquare())
   18. [isNoContainerOrEmpty()](#isNoContainerOrEmpty())
   19. [renderlast()](#renderlast())
   20. [reset()](#reset())
   21. [readFromScript(T)](#readFromScript(T))
   22. [isValidOwnerType(GameEntityType)](#isValidOwnerType(zombie.entity.GameEntityType))
   23. [onAddedToOwner()](#onAddedToOwner())
   24. [onRemovedFromOwner()](#onRemovedFromOwner())
   25. [sendComponentEvent(ComponentEventType)](#sendComponentEvent(zombie.entity.events.ComponentEventType))
   26. [sendComponentEvent(ComponentEvent)](#sendComponentEvent(zombie.entity.events.ComponentEvent))
   27. [onConnectComponents()](#onConnectComponents())
   28. [onFirstCreation()](#onFirstCreation())
   29. [onComponentEvent(ComponentEvent)](#onComponentEvent(zombie.entity.events.ComponentEvent))
   30. [onEntityEvent(EntityEvent)](#onEntityEvent(zombie.entity.events.EntityEvent))
   31. [sendServerPacketTo(IsoPlayer, EntityPacketData)](#sendServerPacketTo(zombie.characters.IsoPlayer,zombie.entity.network.EntityPacketData))
   32. [sendClientPacket(EntityPacketData)](#sendClientPacket(zombie.entity.network.EntityPacketData))
   33. [sendServerPacket(EntityPacketData, UdpConnection)](#sendServerPacket(zombie.entity.network.EntityPacketData,zombie.core.raknet.UdpConnection))
   34. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   35. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   36. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   37. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   38. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Component
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.Component

Direct Known Subclasses:
:   `AttributeContainer, ContextMenuConfig, CraftBench, CraftBenchSounds, CraftLogic, CraftRecipeComponent, EntityScriptInfo, FluidContainer, FurnaceLogic, LuaComponent, MashingLogic, MetaTagComponent, Parts, Resources, Signals, SpriteConfig, SpriteOverlayConfig, TestComponent, UiConfig`

---

public abstract class Component
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ComponentType`

  `componentType`

  `protected GameEntity`

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `Component(ComponentType componentType)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `DoTooltip(ObjectTooltip tooltipUI)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `void`

  `dumpContentsInSquare()`

  `final <T extends Component>  
  T`

  `getComponent(ComponentType type)`

  `final ComponentType`

  `getComponentType()`

  `final GameEntity`

  `getGameEntity()`

  `final GameEntity`

  `getOwner()`

  `int`

  `getRenderLastPriority()`

  `final IsoPlayer`

  `getUsingPlayer()`

  `final boolean`

  `isAddedToEngine()`

  Returns true if component has been added to entity,
  and the entity has been added to Engine.

  `boolean`

  `isNoContainerOrEmpty()`

  `boolean`

  `isQualifiesForMetaStorage()`

  Defaults true, can be overridden.

  `final boolean`

  `isRenderLast()`

  `boolean`

  `isRunningInMeta()`

  `final boolean`

  `isUsingPlayer(IsoPlayer target)`

  `boolean`

  `isValid()`

  `boolean`

  `isValidOwnerType(GameEntityType type)`

  `protected void`

  `load(ByteBuffer input,
  int worldVersion)`

  `protected abstract void`

  `loadSyncData(ByteBuffer input)`

  `protected void`

  `onAddedToOwner()`

  `protected void`

  `onComponentEvent(ComponentEvent event)`

  `protected void`

  `onConnectComponents()`

  Called when:
  - Entity is created, or loaded from save, after all components are added.

  `protected void`

  `onEntityEvent(EntityEvent event)`

  `protected void`

  `onFirstCreation()`

  Called when the entity is created for the first time, after all components are added and connected.

  `protected abstract boolean`

  `onReceivePacket(zombie.core.network.ByteBufferReader input,
  zombie.entity.network.EntityPacketType type,
  zombie.network.IConnection senderConnection)`

  `protected void`

  `onRemovedFromOwner()`

  `protected <T extends ComponentScript>  
  void`

  `readFromScript(T script)`

  `protected void`

  `renderlast()`

  Used for modules to implement renderlast logic.

  `protected void`

  `reset()`

  `protected void`

  `save(ByteBuffer output)`

  `protected abstract void`

  `saveSyncData(ByteBuffer output)`

  `protected final void`

  `sendClientPacket(zombie.entity.network.EntityPacketData data)`

  `protected final void`

  `sendComponentEvent(ComponentEvent event)`

  `protected final void`

  `sendComponentEvent(ComponentEventType eventType)`

  `protected final void`

  `sendServerPacket(zombie.entity.network.EntityPacketData data,
  zombie.core.raknet.UdpConnection ignoreConnection)`

  `final void`

  `sendServerPacketTo(IsoPlayer player,
  zombie.entity.network.EntityPacketData data)`

  `protected final void`

  `setOwner(GameEntity owner)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### owner

    protected [GameEntity](GameEntity.html "class in zombie.entity") owner
  + ### componentType

    private final [ComponentType](ComponentType.html "enum class in zombie.entity") componentType
* Constructor Details
  -------------------

  + ### Component

    protected Component([ComponentType](ComponentType.html "enum class in zombie.entity") componentType)
* Method Details
  --------------

  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### isRunningInMeta

    public boolean isRunningInMeta()
  + ### isQualifiesForMetaStorage

    public boolean isQualifiesForMetaStorage()

    Defaults true, can be overridden.
    Should return true if the component has the conditions required for it to require meta updating.
    This can be used to limit the amount of meta entities stored in meta system.
    For example a craft station that is not running and has no logistic connections could be omitted.
  + ### isAddedToEngine

    public final boolean isAddedToEngine()

    Returns true if component has been added to entity,
    and the entity has been added to Engine.
  + ### getOwner

    public final [GameEntity](GameEntity.html "class in zombie.entity") getOwner()
  + ### getGameEntity

    public final [GameEntity](GameEntity.html "class in zombie.entity") getGameEntity()
  + ### isUsingPlayer

    public final boolean isUsingPlayer([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") target)
  + ### getUsingPlayer

    public final [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getUsingPlayer()
  + ### getComponentType

    public final [ComponentType](ComponentType.html "enum class in zombie.entity") getComponentType()
  + ### setOwner

    protected final void setOwner([GameEntity](GameEntity.html "class in zombie.entity") owner)
  + ### getComponent

    public final <T extends [Component](Component.html "class in zombie.entity")> T getComponent([ComponentType](ComponentType.html "enum class in zombie.entity") type)
  + ### isValid

    public boolean isValid()
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI)
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)
  + ### isRenderLast

    public final boolean isRenderLast()
  + ### getRenderLastPriority

    public int getRenderLastPriority()
  + ### dumpContentsInSquare

    public void dumpContentsInSquare()
  + ### isNoContainerOrEmpty

    public boolean isNoContainerOrEmpty()
  + ### renderlast

    protected void renderlast()

    Used for modules to implement renderlast logic. (ChatElement)
  + ### reset

    protected void reset()
  + ### readFromScript

    protected <T extends [ComponentScript](../scripting/entity/ComponentScript.html "class in zombie.scripting.entity")> void readFromScript(T script)
  + ### isValidOwnerType

    public boolean isValidOwnerType([GameEntityType](GameEntityType.html "enum class in zombie.entity") type)
  + ### onAddedToOwner

    protected void onAddedToOwner()
  + ### onRemovedFromOwner

    protected void onRemovedFromOwner()
  + ### sendComponentEvent

    protected final void sendComponentEvent([ComponentEventType](events/ComponentEventType.html "enum class in zombie.entity.events") eventType)
  + ### sendComponentEvent

    protected final void sendComponentEvent([ComponentEvent](events/ComponentEvent.html "class in zombie.entity.events") event)
  + ### onConnectComponents

    protected void onConnectComponents()

    Called when:
    - Entity is created, or loaded from save, after all components are added.
    - other Components are added/removed after creation.
    - all Components have been transferred to a new entity.
  + ### onFirstCreation

    protected void onFirstCreation()

    Called when the entity is created for the first time, after all components are added and connected.
    Can be used to do initial randomization.
  + ### onComponentEvent

    protected void onComponentEvent([ComponentEvent](events/ComponentEvent.html "class in zombie.entity.events") event)
  + ### onEntityEvent

    protected void onEntityEvent([EntityEvent](events/EntityEvent.html "class in zombie.entity.events") event)
  + ### sendServerPacketTo

    public final void sendServerPacketTo([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    zombie.entity.network.EntityPacketData data)
  + ### sendClientPacket

    protected final void sendClientPacket(zombie.entity.network.EntityPacketData data)
  + ### sendServerPacket

    protected final void sendServerPacket(zombie.entity.network.EntityPacketData data,
    zombie.core.raknet.UdpConnection ignoreConnection)
  + ### onReceivePacket

    protected abstract boolean onReceivePacket(zombie.core.network.ByteBufferReader input,
    zombie.entity.network.EntityPacketType type,
    zombie.network.IConnection senderConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### saveSyncData

    protected abstract void saveSyncData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadSyncData

    protected abstract void loadSyncData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    protected void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    protected void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`