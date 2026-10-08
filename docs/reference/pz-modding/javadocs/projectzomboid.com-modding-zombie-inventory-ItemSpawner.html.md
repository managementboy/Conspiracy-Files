[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [ItemSpawner](ItemSpawner.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [ItemSpawner()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [inc(InventoryItem, int)](#inc(zombie.inventory.InventoryItem,int))
   2. [spawnItems(InventoryItem, int, ItemContainer)](#spawnItems(zombie.inventory.InventoryItem,int,zombie.inventory.ItemContainer))
   3. [spawnItems(String, int, ItemContainer)](#spawnItems(java.lang.String,int,zombie.inventory.ItemContainer))
   4. [spawnItem(InventoryItem, IsoGridSquare, float, float, float, boolean)](#spawnItem(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,float,float,float,boolean))
   5. [spawnItem(InventoryItem, IsoGridSquare, float, float, float)](#spawnItem(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,float,float,float))
   6. [spawnItem(InventoryItem, IsoGridSquare)](#spawnItem(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare))
   7. [spawnItem(InventoryItem, IsoGridSquare, boolean)](#spawnItem(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,boolean))
   8. [spawnItem(String, IsoGridSquare, float, float, float, boolean)](#spawnItem(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,boolean))
   9. [spawnItem(String, IsoGridSquare, float, float, float)](#spawnItem(java.lang.String,zombie.iso.IsoGridSquare,float,float,float))
   10. [spawnItem(InventoryItem, ItemContainer, boolean)](#spawnItem(zombie.inventory.InventoryItem,zombie.inventory.ItemContainer,boolean))
   11. [spawnItem(InventoryItem, ItemContainer)](#spawnItem(zombie.inventory.InventoryItem,zombie.inventory.ItemContainer))
   12. [spawnItem(String, ItemContainer, boolean)](#spawnItem(java.lang.String,zombie.inventory.ItemContainer,boolean))
   13. [spawnItem(String, ItemContainer)](#spawnItem(java.lang.String,zombie.inventory.ItemContainer))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemSpawner
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemSpawner

---

public abstract class ItemSpawner
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

ItemSpawner.class provides helper methods to spawn objects both in containers and as world items, and tracks the
number of each item spawned using the InstanceTracker.

Instead of using methods such as IsoGridSquare.AddWorldInventoryItem() or ItemContainer.AddItem()
to spawn items, wrapper functions in the ItemTracker can be used instead.

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemSpawner()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `inc(InventoryItem item,
  int count)`

  Increments the Tracker for the specified item by the given count.

  `static InventoryItem`

  `spawnItem(String itemType,
  ItemContainer container)`

  Spawns an item in a container and increments the tracked counter.

  `static InventoryItem`

  `spawnItem(String itemType,
  ItemContainer container,
  boolean fill)`

  Spawns an item in a container and increments the tracked counter.

  `static InventoryItem`

  `spawnItem(String itemType,
  IsoGridSquare square,
  float x,
  float y,
  float z)`

  Spawns am item in the world at the specified location.

  `static InventoryItem`

  `spawnItem(String itemType,
  IsoGridSquare square,
  float x,
  float y,
  float z,
  boolean fill)`

  Spawns am item in the world at the specified location.

  `static InventoryItem`

  `spawnItem(InventoryItem item,
  ItemContainer container)`

  Spawns an item in a container and increments the tracked counter.

  `static InventoryItem`

  `spawnItem(InventoryItem item,
  ItemContainer container,
  boolean fill)`

  Spawns an item in a container and increments the tracked counter.

  `static InventoryItem`

  `spawnItem(InventoryItem item,
  IsoGridSquare square)`

  Spawns am item in the world at the specified location.

  `static InventoryItem`

  `spawnItem(InventoryItem item,
  IsoGridSquare square,
  boolean fill)`

  Spawns am item in the world at the specified location.

  `static InventoryItem`

  `spawnItem(InventoryItem item,
  IsoGridSquare square,
  float x,
  float y,
  float z)`

  Spawns am item in the world at the specified location.

  `static InventoryItem`

  `spawnItem(InventoryItem item,
  IsoGridSquare square,
  float x,
  float y,
  float z,
  boolean fill)`

  Spawns am item in the world at the specified location.

  `static List<InventoryItem>`

  `spawnItems(String itemType,
  int count,
  ItemContainer container)`

  Spawns multiple instances of an item and raises the tracked counter.

  `static List<InventoryItem>`

  `spawnItems(InventoryItem item,
  int count,
  ItemContainer container)`

  Spawns multiple instances of an item and raises the tracked counter.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### ItemSpawner

    public ItemSpawner()
* Method Details
  --------------

  + ### inc

    private static void inc([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    int count)

    Increments the Tracker for the specified item by the given count.

    Parameters:
    :   `item` - The InventoryItem that spawned.
    :   `count` - The number of this item that spawned.
  + ### spawnItems

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> spawnItems([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    int count,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container)

    Spawns multiple instances of an item and raises the tracked counter.
    This is a wrapper for [`ItemContainer.AddItems(InventoryItem, int)`](ItemContainer.html#AddItems(zombie.inventory.InventoryItem,int))

    Parameters:
    :   `item` - The InventoryItem that spawned.
    :   `count` - The number that spawned.
    :   `container` - The ItemContainer it spawned into.

    See Also:
    :   - [`ItemContainer.AddItems(InventoryItem, int)`](ItemContainer.html#AddItems(zombie.inventory.InventoryItem,int))
  + ### spawnItems

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> spawnItems([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    int count,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container)

    Spawns multiple instances of an item and raises the tracked counter.
    This is a wrapper for [`ItemContainer.AddItems(String, int)`](ItemContainer.html#AddItems(java.lang.String,int))

    Parameters:
    :   `itemType` - The item type that spawned.
    :   `count` - The number that spawned.
    :   `container` - The ItemContainer it spawned into.

    Returns:
    :   A ArrayList of the InventoryItems that spawned.

    See Also:
    :   - [`ItemContainer.AddItems(String, int)`](ItemContainer.html#AddItems(java.lang.String,int))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    float x,
    float y,
    float z,
    boolean fill)

    Spawns am item in the world at the specified location.
    This is a wrapper for [`IsoGridSquare.AddWorldInventoryItem(InventoryItem, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float))

    Parameters:
    :   `item` - The InventoryItem that spawned.
    :   `square` - The IsoGridSquare it spawned in.
    :   `x` - The X offset.
    :   `y` - The Y offset.
    :   `z` - The Z offset.
    :   `fill` - If true and itemType is also a container, attempt to fill it with items.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`IsoGridSquare.AddWorldInventoryItem(InventoryItem, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    float x,
    float y,
    float z)

    Spawns am item in the world at the specified location.
    This is a wrapper for [`IsoGridSquare.AddWorldInventoryItem(InventoryItem, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float))

    Parameters:
    :   `item` - The InventoryItem that spawned.
    :   `square` - The IsoGridSquare it spawned in.
    :   `x` - The X offset.
    :   `y` - The Y offset.
    :   `z` - The Z offset.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`IsoGridSquare.AddWorldInventoryItem(InventoryItem, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)

    Spawns am item in the world at the specified location.
    This is a wrapper for [`IsoGridSquare.AddWorldInventoryItem(InventoryItem, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float))

    Parameters:
    :   `item` - The InventoryItem that spawned.
    :   `square` - The IsoGridSquare it spawned in.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`IsoGridSquare.AddWorldInventoryItem(InventoryItem, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    boolean fill)

    Spawns am item in the world at the specified location.
    This is a wrapper for [`IsoGridSquare.AddWorldInventoryItem(InventoryItem, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float))

    Parameters:
    :   `item` - The InventoryItem that spawned.
    :   `square` - The IsoGridSquare it spawned in.
    :   `fill` - If true and itemType is also a container, attempt to fill it with items.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`IsoGridSquare.AddWorldInventoryItem(InventoryItem, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(zombie.inventory.InventoryItem,float,float,float))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    float x,
    float y,
    float z,
    boolean fill)

    Spawns am item in the world at the specified location.
    This is a wrapper for [`IsoGridSquare.AddWorldInventoryItem(String, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(java.lang.String,float,float,float))

    Parameters:
    :   `itemType` - The item type that spawned.
    :   `square` - The IsoGridSquare it spawned in.
    :   `x` - The X offset.
    :   `y` - The Y offset.
    :   `z` - The Z offset.
    :   `fill` - If true and itemType is also a container, attempt to fill it with items.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`IsoGridSquare.AddWorldInventoryItem(String, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(java.lang.String,float,float,float))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    float x,
    float y,
    float z)

    Spawns am item in the world at the specified location.
    This is a wrapper for [`IsoGridSquare.AddWorldInventoryItem(String, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(java.lang.String,float,float,float))

    Parameters:
    :   `itemType` - The item type that spawned.
    :   `square` - The IsoGridSquare it spawned in.
    :   `x` - The X offset.
    :   `y` - The Y offset.
    :   `z` - The Z offset.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`IsoGridSquare.AddWorldInventoryItem(String, float, float, float)`](../iso/IsoGridSquare.html#AddWorldInventoryItem(java.lang.String,float,float,float))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    boolean fill)

    Spawns an item in a container and increments the tracked counter.
    This is a wrapper for [`ItemContainer.AddItem(InventoryItem)`](ItemContainer.html#AddItem(zombie.inventory.InventoryItem))

    Parameters:
    :   `item` - The InventoryItem that spawned.
    :   `container` - The ItemContainer it spawned into.
    :   `fill` - If true and itemType is also a container, attempt to fill it with items.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`ItemContainer.AddItem(InventoryItem)`](ItemContainer.html#AddItem(zombie.inventory.InventoryItem))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container)

    Spawns an item in a container and increments the tracked counter.
    This is a wrapper for [`ItemContainer.AddItem(InventoryItem)`](ItemContainer.html#AddItem(zombie.inventory.InventoryItem))

    Parameters:
    :   `item` - The InventoryItem that spawned.
    :   `container` - The ItemContainer it spawned into.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`ItemContainer.AddItem(InventoryItem)`](ItemContainer.html#AddItem(zombie.inventory.InventoryItem))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    boolean fill)

    Spawns an item in a container and increments the tracked counter.
    This is a wrapper for [`ItemContainer.AddItem(String)`](ItemContainer.html#AddItem(java.lang.String))

    Parameters:
    :   `itemType` - The item type that spawned.
    :   `container` - The ItemContainer it spawned into.
    :   `fill` - If true and itemType is also a container, attempt to fill it with items.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`ItemContainer.AddItem(String)`](ItemContainer.html#AddItem(java.lang.String))
  + ### spawnItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container)

    Spawns an item in a container and increments the tracked counter.
    This is a wrapper for [`ItemContainer.AddItem(String)`](ItemContainer.html#AddItem(java.lang.String))

    Parameters:
    :   `itemType` - The item type that spawned.
    :   `container` - The ItemContainer it spawned into.

    Returns:
    :   The InventoryItem that spawned.

    See Also:
    :   - [`ItemContainer.AddItem(String)`](ItemContainer.html#AddItem(java.lang.String))