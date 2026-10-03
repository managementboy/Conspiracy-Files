[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.resources](package-summary.html)
2. [ResourceItem](ResourceItem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [itemFilter](#itemFilter)
   2. [storedItems](#storedItems)
   3. [capacity](#capacity)
   4. [stackAnyItem](#stackAnyItem)
6. [Constructor Details](#constructor-detail)
   1. [ResourceItem()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [loadBlueprint(ResourceBlueprint)](#loadBlueprint(zombie.entity.components.resources.ResourceBlueprint))
   2. [getItemFilter()](#getItemFilter())
   3. [storedSize()](#storedSize())
   4. [isStackAnyItem()](#isStackAnyItem())
   5. [DoTooltip(ObjectTooltip)](#DoTooltip(zombie.ui.ObjectTooltip))
   6. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   7. [DoDebugTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoDebugTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   8. [isFull()](#isFull())
   9. [isEmpty()](#isEmpty())
   10. [getItemAmount()](#getItemAmount())
   11. [getItemAmount(Item)](#getItemAmount(zombie.scripting.objects.Item))
   12. [getItemUses(InputScript)](#getItemUses(zombie.scripting.entity.components.crafting.InputScript))
   13. [getFluidAmount()](#getFluidAmount())
   14. [getEnergyAmount()](#getEnergyAmount())
   15. [getItemUsesAmount()](#getItemUsesAmount())
   16. [getItemCapacity()](#getItemCapacity())
   17. [getFluidCapacity()](#getFluidCapacity())
   18. [getEnergyCapacity()](#getEnergyCapacity())
   19. [getItemUsesCapacity()](#getItemUsesCapacity())
   20. [getFreeItemCapacity()](#getFreeItemCapacity())
   21. [getFreeFluidCapacity()](#getFreeFluidCapacity())
   22. [getFreeEnergyCapacity()](#getFreeEnergyCapacity())
   23. [getFreeItemUsesCapacity()](#getFreeItemUsesCapacity())
   24. [containsItem(InventoryItem)](#containsItem(zombie.inventory.InventoryItem))
   25. [acceptsItem(InventoryItem, boolean)](#acceptsItem(zombie.inventory.InventoryItem,boolean))
   26. [canStackItem(InventoryItem)](#canStackItem(zombie.inventory.InventoryItem))
   27. [canStackItem(Item)](#canStackItem(zombie.scripting.objects.Item))
   28. [offerItem(InventoryItem, boolean)](#offerItem(zombie.inventory.InventoryItem,boolean))
   29. [offerItem(InventoryItem, boolean, boolean, boolean)](#offerItem(zombie.inventory.InventoryItem,boolean,boolean,boolean))
   30. [offerItems(List)](#offerItems(java.util.List))
   31. [offerItems(List, boolean)](#offerItems(java.util.List,boolean))
   32. [removeAllItems(ArrayList)](#removeAllItems(java.util.ArrayList))
   33. [removeAllItems(ArrayList, Item)](#removeAllItems(java.util.ArrayList,zombie.scripting.objects.Item))
   34. [pollItem()](#pollItem())
   35. [pollItem(boolean, boolean)](#pollItem(boolean,boolean))
   36. [peekItem()](#peekItem())
   37. [getItemById(int)](#getItemById(int))
   38. [removeItem(InventoryItem)](#removeItem(zombie.inventory.InventoryItem))
   39. [removeItemById(int)](#removeItemById(int))
   40. [peekItem(int)](#peekItem(int))
   41. [getStoredItems()](#getStoredItems())
   42. [getStoredItemsOfType(Item)](#getStoredItemsOfType(zombie.scripting.objects.Item))
   43. [getUniqueItems()](#getUniqueItems())
   44. [tryTransferTo(Resource)](#tryTransferTo(zombie.entity.components.resources.Resource))
   45. [tryTransferTo(Resource, float)](#tryTransferTo(zombie.entity.components.resources.Resource,float))
   46. [transferTo(ResourceItem, int)](#transferTo(zombie.entity.components.resources.ResourceItem,int))
   47. [clear()](#clear())
   48. [reset()](#reset())
   49. [saveSync(ByteBuffer)](#saveSync(java.nio.ByteBuffer))
   50. [loadSync(ByteBuffer, int)](#loadSync(java.nio.ByteBuffer,int))
   51. [tryLoadSyncItems(ByteBuffer, int, int, String, boolean)](#tryLoadSyncItems(java.nio.ByteBuffer,int,int,java.lang.String,boolean))
   52. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   53. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class ResourceItem
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.resources.Resource](Resource.html "class in zombie.entity.components.resources")

zombie.entity.components.resources.ResourceItem

---

public class ResourceItem
extends [Resource](Resource.html "class in zombie.entity.components.resources")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `capacity`

  `private final zombie.inventory.ItemFilter`

  `itemFilter`

  `private boolean`

  `stackAnyItem`

  `private final ArrayList<InventoryItem>`

  `storedItems`

  ### Fields inherited from class [Resource](Resource.html#field-summary "class in zombie.entity.components.resources")

  `group, resourcesComponent`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `ResourceItem()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `acceptsItem(InventoryItem item,
  boolean ignoreFilters)`

  `boolean`

  `canStackItem(InventoryItem item)`

  `boolean`

  `canStackItem(Item item)`

  `void`

  `clear()`

  `boolean`

  `containsItem(InventoryItem item)`

  `protected void`

  `DoDebugTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `float`

  `getEnergyAmount()`

  `float`

  `getEnergyCapacity()`

  `float`

  `getFluidAmount()`

  `float`

  `getFluidCapacity()`

  `float`

  `getFreeEnergyCapacity()`

  `float`

  `getFreeFluidCapacity()`

  `int`

  `getFreeItemCapacity()`

  `float`

  `getFreeItemUsesCapacity()`

  `int`

  `getItemAmount()`

  `int`

  `getItemAmount(Item itemType)`

  `InventoryItem`

  `getItemById(int id)`

  `int`

  `getItemCapacity()`

  `zombie.inventory.ItemFilter`

  `getItemFilter()`

  `float`

  `getItemUses(InputScript inputScript)`

  `float`

  `getItemUsesAmount()`

  `float`

  `getItemUsesCapacity()`

  `ArrayList<InventoryItem>`

  `getStoredItems()`

  `ArrayList<InventoryItem>`

  `getStoredItemsOfType(Item itemType)`

  `ArrayList<Item>`

  `getUniqueItems()`

  `boolean`

  `isEmpty()`

  `boolean`

  `isFull()`

  `boolean`

  `isStackAnyItem()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `(package private) void`

  `loadBlueprint(ResourceBlueprint bp)`

  `void`

  `loadSync(ByteBuffer input,
  int worldVersion)`

  `InventoryItem`

  `offerItem(InventoryItem item,
  boolean ignoreFilters)`

  `InventoryItem`

  `offerItem(InventoryItem item,
  boolean ignoreFilters,
  boolean force,
  boolean syncEntity)`

  `ArrayList<InventoryItem>`

  `offerItems(List<InventoryItem> items)`

  `ArrayList<InventoryItem>`

  `offerItems(List<InventoryItem> items,
  boolean ignoreFilters)`

  `InventoryItem`

  `peekItem()`

  `InventoryItem`

  `peekItem(int offset)`

  Expects a positive number to offset peek by.

  `InventoryItem`

  `pollItem()`

  `InventoryItem`

  `pollItem(boolean force,
  boolean syncEntity)`

  `ArrayList<InventoryItem>`

  `removeAllItems(ArrayList<InventoryItem> list)`

  `ArrayList<InventoryItem>`

  `removeAllItems(ArrayList<InventoryItem> list,
  Item itemType)`

  `InventoryItem`

  `removeItem(InventoryItem item)`

  `InventoryItem`

  `removeItemById(int id)`

  `protected void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `saveSync(ByteBuffer output)`

  `int`

  `storedSize()`

  `void`

  `transferTo(ResourceItem target,
  int transferAmount)`

  `boolean`

  `tryLoadSyncItems(ByteBuffer input,
  int worldVersion,
  int size,
  String type,
  boolean forceCreate)`

  `void`

  `tryTransferTo(Resource target)`

  `void`

  `tryTransferTo(Resource target,
  float amount)`

  ### Methods inherited from class [Resource](Resource.html#method-summary "class in zombie.entity.components.resources")

  `acceptsItem, canDrainFromItem, canDrainToItem, canMoveItemsToOutput, drainFromItem, drainToItem, getChannel, getDebugFlagsString, getFilterName, getGameEntity, getGroup, getId, getIO, getProgress, getResourcesComponent, getType, hasFlag, isAutoDecay, isDirty, isLocked, isTemporary, offerItem, resetDirty, setDirty, setGroup, setLocked, setProgress, setResourcesComponent, sync`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### itemFilter

    private final zombie.inventory.ItemFilter itemFilter
  + ### storedItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> storedItems
  + ### capacity

    private float capacity
  + ### stackAnyItem

    private boolean stackAnyItem
* Constructor Details
  -------------------

  + ### ResourceItem

    protected ResourceItem()
* Method Details
  --------------

  + ### loadBlueprint

    void loadBlueprint([ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") bp)

    Overrides:
    :   `loadBlueprint` in class `Resource`
  + ### getItemFilter

    public zombie.inventory.ItemFilter getItemFilter()
  + ### storedSize

    public int storedSize()
  + ### isStackAnyItem

    public boolean isStackAnyItem()
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI)

    Overrides:
    :   `DoTooltip` in class `Resource`
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoTooltip` in class `Resource`
  + ### DoDebugTooltip

    protected void DoDebugTooltip([ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoDebugTooltip` in class `Resource`
  + ### isFull

    public boolean isFull()

    Specified by:
    :   `isFull` in class `Resource`
  + ### isEmpty

    public boolean isEmpty()

    Specified by:
    :   `isEmpty` in class `Resource`
  + ### getItemAmount

    public int getItemAmount()

    Overrides:
    :   `getItemAmount` in class `Resource`
  + ### getItemAmount

    public int getItemAmount([Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") itemType)
  + ### getItemUses

    public float getItemUses([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)

    Overrides:
    :   `getItemUses` in class `Resource`
  + ### getFluidAmount

    public float getFluidAmount()

    Overrides:
    :   `getFluidAmount` in class `Resource`
  + ### getEnergyAmount

    public float getEnergyAmount()

    Overrides:
    :   `getEnergyAmount` in class `Resource`
  + ### getItemUsesAmount

    public float getItemUsesAmount()

    Overrides:
    :   `getItemUsesAmount` in class `Resource`
  + ### getItemCapacity

    public int getItemCapacity()

    Overrides:
    :   `getItemCapacity` in class `Resource`
  + ### getFluidCapacity

    public float getFluidCapacity()

    Overrides:
    :   `getFluidCapacity` in class `Resource`
  + ### getEnergyCapacity

    public float getEnergyCapacity()

    Overrides:
    :   `getEnergyCapacity` in class `Resource`
  + ### getItemUsesCapacity

    public float getItemUsesCapacity()

    Overrides:
    :   `getItemUsesCapacity` in class `Resource`
  + ### getFreeItemCapacity

    public int getFreeItemCapacity()

    Overrides:
    :   `getFreeItemCapacity` in class `Resource`
  + ### getFreeFluidCapacity

    public float getFreeFluidCapacity()

    Overrides:
    :   `getFreeFluidCapacity` in class `Resource`
  + ### getFreeEnergyCapacity

    public float getFreeEnergyCapacity()

    Overrides:
    :   `getFreeEnergyCapacity` in class `Resource`
  + ### getFreeItemUsesCapacity

    public float getFreeItemUsesCapacity()

    Overrides:
    :   `getFreeItemUsesCapacity` in class `Resource`
  + ### containsItem

    public boolean containsItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Overrides:
    :   `containsItem` in class `Resource`
  + ### acceptsItem

    public boolean acceptsItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean ignoreFilters)

    Overrides:
    :   `acceptsItem` in class `Resource`
  + ### canStackItem

    public boolean canStackItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Overrides:
    :   `canStackItem` in class `Resource`
  + ### canStackItem

    public boolean canStackItem([Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") item)

    Overrides:
    :   `canStackItem` in class `Resource`
  + ### offerItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") offerItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean ignoreFilters)

    Overrides:
    :   `offerItem` in class `Resource`
  + ### offerItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") offerItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean ignoreFilters,
    boolean force,
    boolean syncEntity)

    Overrides:
    :   `offerItem` in class `Resource`
  + ### offerItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> offerItems([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### offerItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> offerItems([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> items,
    boolean ignoreFilters)
  + ### removeAllItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> removeAllItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### removeAllItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> removeAllItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> list,
    [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") itemType)
  + ### pollItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") pollItem()

    Overrides:
    :   `pollItem` in class `Resource`
  + ### pollItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") pollItem(boolean force,
    boolean syncEntity)

    Overrides:
    :   `pollItem` in class `Resource`
  + ### peekItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") peekItem()

    Overrides:
    :   `peekItem` in class `Resource`
  + ### getItemById

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") getItemById(int id)
  + ### removeItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") removeItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### removeItemById

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") removeItemById(int id)
  + ### peekItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") peekItem(int offset)

    Expects a positive number to offset peek by.

    Overrides:
    :   `peekItem` in class `Resource`
  + ### getStoredItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> getStoredItems()
  + ### getStoredItemsOfType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> getStoredItemsOfType([Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") itemType)
  + ### getUniqueItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects")> getUniqueItems()
  + ### tryTransferTo

    public void tryTransferTo([Resource](Resource.html "class in zombie.entity.components.resources") target)

    Overrides:
    :   `tryTransferTo` in class `Resource`
  + ### tryTransferTo

    public void tryTransferTo([Resource](Resource.html "class in zombie.entity.components.resources") target,
    float amount)

    Overrides:
    :   `tryTransferTo` in class `Resource`
  + ### transferTo

    public void transferTo([ResourceItem](ResourceItem.html "class in zombie.entity.components.resources") target,
    int transferAmount)
  + ### clear

    public void clear()

    Specified by:
    :   `clear` in class `Resource`
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `Resource`
  + ### saveSync

    public void saveSync([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `saveSync` in class `Resource`

    Throws:
    :   `IOException`
  + ### loadSync

    public void loadSync([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `loadSync` in class `Resource`

    Throws:
    :   `IOException`
  + ### tryLoadSyncItems

    public boolean tryLoadSyncItems([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    int size,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    boolean forceCreate)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `Resource`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `Resource`

    Throws:
    :   `IOException`