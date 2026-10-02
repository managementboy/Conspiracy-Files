[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [GameEntityFactory](GameEntityFactory.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [GameEntityFactory()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [TransferComponents(GameEntity, GameEntity)](#TransferComponents(zombie.entity.GameEntity,zombie.entity.GameEntity))
   2. [TransferComponent(GameEntity, GameEntity, ComponentType)](#TransferComponent(zombie.entity.GameEntity,zombie.entity.GameEntity,zombie.entity.ComponentType))
   3. [CreateIsoEntityFromCellLoading(IsoObject)](#CreateIsoEntityFromCellLoading(zombie.iso.IsoObject))
   4. [createIsoEntityFromCustomItem(IsoObject, String, boolean)](#createIsoEntityFromCustomItem(zombie.iso.IsoObject,java.lang.String,boolean))
   5. [CreateInventoryItemEntity(InventoryItem, Item, boolean)](#CreateInventoryItemEntity(zombie.inventory.InventoryItem,zombie.scripting.objects.Item,boolean))
   6. [CreateIsoObjectEntity(IsoObject, GameEntityScript, boolean)](#CreateIsoObjectEntity(zombie.iso.IsoObject,zombie.scripting.entity.GameEntityScript,boolean))
   7. [CreateEntityDebugReload(GameEntity, GameEntityScript, boolean)](#CreateEntityDebugReload(zombie.entity.GameEntity,zombie.scripting.entity.GameEntityScript,boolean))
   8. [createEntity(GameEntity, boolean)](#createEntity(zombie.entity.GameEntity,boolean))
   9. [createEntity(GameEntity, GameEntityScript, boolean)](#createEntity(zombie.entity.GameEntity,zombie.scripting.entity.GameEntityScript,boolean))
   10. [instanceComponents(GameEntity, GameEntityScript)](#instanceComponents(zombie.entity.GameEntity,zombie.scripting.entity.GameEntityScript))
   11. [RemoveComponentType(GameEntity, ComponentType)](#RemoveComponentType(zombie.entity.GameEntity,zombie.entity.ComponentType))
   12. [RemoveComponentTypes(GameEntity, EnumSet)](#RemoveComponentTypes(zombie.entity.GameEntity,java.util.EnumSet))
   13. [RemoveComponent(GameEntity, Component)](#RemoveComponent(zombie.entity.GameEntity,zombie.entity.Component))
   14. [RemoveComponents(GameEntity, Component...)](#RemoveComponents(zombie.entity.GameEntity,zombie.entity.Component...))
   15. [AddComponent(GameEntity, Component)](#AddComponent(zombie.entity.GameEntity,zombie.entity.Component))
   16. [AddComponents(GameEntity, Component...)](#AddComponents(zombie.entity.GameEntity,zombie.entity.Component...))
   17. [AddComponent(GameEntity, boolean, Component)](#AddComponent(zombie.entity.GameEntity,boolean,zombie.entity.Component))
   18. [AddComponents(GameEntity, boolean, Component...)](#AddComponents(zombie.entity.GameEntity,boolean,zombie.entity.Component...))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameEntityFactory
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.GameEntityFactory

---

public class GameEntityFactory
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameEntityFactory()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `AddComponent(GameEntity entity,
  boolean replace,
  Component component)`

  `static void`

  `AddComponent(GameEntity entity,
  Component component)`

  `static void`

  `AddComponents(GameEntity entity,
  boolean replace,
  Component... components)`

  `static void`

  `AddComponents(GameEntity entity,
  Component... components)`

  `private static void`

  `createEntity(GameEntity entity,
  boolean isFirstTimeCreated)`

  `private static void`

  `createEntity(GameEntity entity,
  GameEntityScript script,
  boolean isFirstTimeCreated)`

  `static void`

  `CreateEntityDebugReload(GameEntity entity,
  GameEntityScript script,
  boolean isFirstTimeCreated)`

  `static void`

  `CreateInventoryItemEntity(InventoryItem inventoryItem,
  Item itemScript,
  boolean isFirstTimeCreated)`

  Used when items are created.

  `static void`

  `CreateIsoEntityFromCellLoading(IsoObject isoObject)`

  Used when IsoObjects are loaded from the original map data.

  `private static void`

  `createIsoEntityFromCustomItem(IsoObject isoObject,
  String customItem,
  boolean isFirstTimeCreated)`

  `static void`

  `CreateIsoObjectEntity(IsoObject isoObject,
  GameEntityScript script,
  boolean isFirstTimeCreated)`

  Used when creating IsoObject entities.

  `private static void`

  `instanceComponents(GameEntity entity,
  GameEntityScript script)`

  `static void`

  `RemoveComponent(GameEntity entity,
  Component component)`

  `static void`

  `RemoveComponents(GameEntity entity,
  Component... components)`

  `static void`

  `RemoveComponentType(GameEntity entity,
  ComponentType componentType)`

  `static void`

  `RemoveComponentTypes(GameEntity entity,
  EnumSet<ComponentType> componentTypes)`

  `static void`

  `TransferComponent(GameEntity source,
  GameEntity target,
  ComponentType componentType)`

  Used with IsoWorldInventoryObject to transfer components from item to isoObject for offload to meta.

  `static void`

  `TransferComponents(GameEntity source,
  GameEntity target)`

  Used with movables to transfer components between iso and item.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### GameEntityFactory

    public GameEntityFactory()
* Method Details
  --------------

  + ### TransferComponents

    public static void TransferComponents([GameEntity](GameEntity.html "class in zombie.entity") source,
    [GameEntity](GameEntity.html "class in zombie.entity") target)

    Used with movables to transfer components between iso and item.
    Currently components can only be transferred between iso and item
    if the iso object is a single tile.
  + ### TransferComponent

    public static void TransferComponent([GameEntity](GameEntity.html "class in zombie.entity") source,
    [GameEntity](GameEntity.html "class in zombie.entity") target,
    [ComponentType](ComponentType.html "enum class in zombie.entity") componentType)

    Used with IsoWorldInventoryObject to transfer components from item to isoObject for offload to meta.
  + ### CreateIsoEntityFromCellLoading

    public static void CreateIsoEntityFromCellLoading([IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject)

    Used when IsoObjects are loaded from the original map data.
    `isFirstTimeCreated` is always true for these objects.
  + ### createIsoEntityFromCustomItem

    private static void createIsoEntityFromCustomItem([IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customItem,
    boolean isFirstTimeCreated)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### CreateInventoryItemEntity

    public static void CreateInventoryItemEntity([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") itemScript,
    boolean isFirstTimeCreated)

    Used when items are created.
    Optionally `isFirstTimeCreated` can be set to false when an item loads from save data.
  + ### CreateIsoObjectEntity

    public static void CreateIsoObjectEntity([IsoObject](../iso/IsoObject.html "class in zombie.iso") isoObject,
    [GameEntityScript](../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") script,
    boolean isFirstTimeCreated)

    Used when creating IsoObject entities.
    For example when player builds object.
  + ### CreateEntityDebugReload

    public static void CreateEntityDebugReload([GameEntity](GameEntity.html "class in zombie.entity") entity,
    [GameEntityScript](../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") script,
    boolean isFirstTimeCreated)
  + ### createEntity

    private static void createEntity([GameEntity](GameEntity.html "class in zombie.entity") entity,
    boolean isFirstTimeCreated)
    throws zombie.entity.GameEntityException

    Throws:
    :   `zombie.entity.GameEntityException`
  + ### createEntity

    private static void createEntity([GameEntity](GameEntity.html "class in zombie.entity") entity,
    [GameEntityScript](../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") script,
    boolean isFirstTimeCreated)
    throws zombie.entity.GameEntityException

    Throws:
    :   `zombie.entity.GameEntityException`
  + ### instanceComponents

    private static void instanceComponents([GameEntity](GameEntity.html "class in zombie.entity") entity,
    [GameEntityScript](../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") script)
  + ### RemoveComponentType

    public static void RemoveComponentType([GameEntity](GameEntity.html "class in zombie.entity") entity,
    [ComponentType](ComponentType.html "enum class in zombie.entity") componentType)
  + ### RemoveComponentTypes

    public static void RemoveComponentTypes([GameEntity](GameEntity.html "class in zombie.entity") entity,
    [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[ComponentType](ComponentType.html "enum class in zombie.entity")> componentTypes)
  + ### RemoveComponent

    public static void RemoveComponent([GameEntity](GameEntity.html "class in zombie.entity") entity,
    [Component](Component.html "class in zombie.entity") component)
  + ### RemoveComponents

    public static void RemoveComponents([GameEntity](GameEntity.html "class in zombie.entity") entity,
    [Component](Component.html "class in zombie.entity")... components)
  + ### AddComponent

    public static void AddComponent([GameEntity](GameEntity.html "class in zombie.entity") entity,
    [Component](Component.html "class in zombie.entity") component)
  + ### AddComponents

    public static void AddComponents([GameEntity](GameEntity.html "class in zombie.entity") entity,
    [Component](Component.html "class in zombie.entity")... components)
  + ### AddComponent

    public static void AddComponent([GameEntity](GameEntity.html "class in zombie.entity") entity,
    boolean replace,
    [Component](Component.html "class in zombie.entity") component)
  + ### AddComponents

    public static void AddComponents([GameEntity](GameEntity.html "class in zombie.entity") entity,
    boolean replace,
    [Component](Component.html "class in zombie.entity")... components)