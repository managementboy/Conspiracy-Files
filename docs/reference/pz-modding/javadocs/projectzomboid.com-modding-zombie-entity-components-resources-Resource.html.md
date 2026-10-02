[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.resources](package-summary.html)
2. [Resource](Resource.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [resourcesComponent](#resourcesComponent)
   2. [group](#group)
   3. [isLocked](#isLocked)
   4. [progress](#progress)
   5. [id](#id)
   6. [resourceType](#resourceType)
   7. [resourceIo](#resourceIo)
   8. [channel](#channel)
   9. [flags](#flags)
   10. [filterName](#filterName)
   11. [dirty](#dirty)
6. [Constructor Details](#constructor-detail)
   1. [Resource()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setGroup(ResourceGroup)](#setGroup(zombie.entity.components.resources.ResourceGroup))
   2. [getGroup()](#getGroup())
   3. [setResourcesComponent(Resources)](#setResourcesComponent(zombie.entity.components.resources.Resources))
   4. [isDirty()](#isDirty())
   5. [setDirty()](#setDirty())
   6. [resetDirty()](#resetDirty())
   7. [getResourcesComponent()](#getResourcesComponent())
   8. [getGameEntity()](#getGameEntity())
   9. [DoTooltip(ObjectTooltip)](#DoTooltip(zombie.ui.ObjectTooltip))
   10. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   11. [DoDebugTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoDebugTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   12. [getId()](#getId())
   13. [getType()](#getType())
   14. [getIO()](#getIO())
   15. [getChannel()](#getChannel())
   16. [isAutoDecay()](#isAutoDecay())
   17. [isTemporary()](#isTemporary())
   18. [hasFlag(ResourceFlag)](#hasFlag(zombie.entity.components.resources.ResourceFlag))
   19. [getDebugFlagsString()](#getDebugFlagsString())
   20. [getFilterName()](#getFilterName())
   21. [loadBlueprint(ResourceBlueprint)](#loadBlueprint(zombie.entity.components.resources.ResourceBlueprint))
   22. [setProgress(double)](#setProgress(double))
   23. [getProgress()](#getProgress())
   24. [isLocked()](#isLocked())
   25. [setLocked(boolean)](#setLocked(boolean))
   26. [isFull()](#isFull())
   27. [isEmpty()](#isEmpty())
   28. [getItemAmount()](#getItemAmount())
   29. [getItemUses(InputScript)](#getItemUses(zombie.scripting.entity.components.crafting.InputScript))
   30. [getFluidAmount()](#getFluidAmount())
   31. [getEnergyAmount()](#getEnergyAmount())
   32. [getItemUsesAmount()](#getItemUsesAmount())
   33. [getItemCapacity()](#getItemCapacity())
   34. [getFluidCapacity()](#getFluidCapacity())
   35. [getEnergyCapacity()](#getEnergyCapacity())
   36. [getItemUsesCapacity()](#getItemUsesCapacity())
   37. [getFreeItemCapacity()](#getFreeItemCapacity())
   38. [getFreeFluidCapacity()](#getFreeFluidCapacity())
   39. [getFreeEnergyCapacity()](#getFreeEnergyCapacity())
   40. [getFreeItemUsesCapacity()](#getFreeItemUsesCapacity())
   41. [canMoveItemsToOutput()](#canMoveItemsToOutput())
   42. [containsItem(InventoryItem)](#containsItem(zombie.inventory.InventoryItem))
   43. [acceptsItem(InventoryItem)](#acceptsItem(zombie.inventory.InventoryItem))
   44. [acceptsItem(InventoryItem, boolean)](#acceptsItem(zombie.inventory.InventoryItem,boolean))
   45. [canStackItem(InventoryItem)](#canStackItem(zombie.inventory.InventoryItem))
   46. [canStackItem(Item)](#canStackItem(zombie.scripting.objects.Item))
   47. [offerItem(InventoryItem)](#offerItem(zombie.inventory.InventoryItem))
   48. [offerItem(InventoryItem, boolean)](#offerItem(zombie.inventory.InventoryItem,boolean))
   49. [offerItem(InventoryItem, boolean, boolean, boolean)](#offerItem(zombie.inventory.InventoryItem,boolean,boolean,boolean))
   50. [pollItem()](#pollItem())
   51. [pollItem(boolean, boolean)](#pollItem(boolean,boolean))
   52. [peekItem()](#peekItem())
   53. [peekItem(int)](#peekItem(int))
   54. [canDrainToItem(InventoryItem)](#canDrainToItem(zombie.inventory.InventoryItem))
   55. [drainToItem(InventoryItem)](#drainToItem(zombie.inventory.InventoryItem))
   56. [canDrainFromItem(InventoryItem)](#canDrainFromItem(zombie.inventory.InventoryItem))
   57. [drainFromItem(InventoryItem)](#drainFromItem(zombie.inventory.InventoryItem))
   58. [tryTransferTo(Resource)](#tryTransferTo(zombie.entity.components.resources.Resource))
   59. [tryTransferTo(Resource, float)](#tryTransferTo(zombie.entity.components.resources.Resource,float))
   60. [clear()](#clear())
   61. [reset()](#reset())
   62. [saveSync(ByteBuffer)](#saveSync(java.nio.ByteBuffer))
   63. [loadSync(ByteBuffer, int)](#loadSync(java.nio.ByteBuffer,int))
   64. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   65. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   66. [sync()](#sync())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class Resource
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.resources.Resource

Direct Known Subclasses:
:   `ResourceEnergy, ResourceFluid, ResourceItem`

---

public abstract class Resource
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ResourceChannel`

  `channel`

  `private boolean`

  `dirty`

  `private String`

  `filterName`

  `private final zombie.entity.util.enums.EnumBitStore<ResourceFlag>`

  `flags`

  `protected zombie.entity.components.resources.ResourceGroup`

  `group`

  `private String`

  `id`

  `private boolean`

  `isLocked`

  `private double`

  `progress`

  `private ResourceIO`

  `resourceIo`

  `protected Resources`

  `resourcesComponent`

  `private ResourceType`

  `resourceType`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `Resource()`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `final boolean`

  `acceptsItem(InventoryItem item)`

  `boolean`

  `acceptsItem(InventoryItem item,
  boolean ignoreFilters)`

  `boolean`

  `canDrainFromItem(InventoryItem item)`

  `boolean`

  `canDrainToItem(InventoryItem item)`

  `boolean`

  `canMoveItemsToOutput()`

  `boolean`

  `canStackItem(InventoryItem item)`

  `boolean`

  `canStackItem(Item item)`

  `abstract void`

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

  `boolean`

  `drainFromItem(InventoryItem item)`

  `boolean`

  `drainToItem(InventoryItem item)`

  `ResourceChannel`

  `getChannel()`

  `String`

  `getDebugFlagsString()`

  `float`

  `getEnergyAmount()`

  `float`

  `getEnergyCapacity()`

  `String`

  `getFilterName()`

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

  `GameEntity`

  `getGameEntity()`

  `(package private) zombie.entity.components.resources.ResourceGroup`

  `getGroup()`

  `String`

  `getId()`

  `ResourceIO`

  `getIO()`

  `int`

  `getItemAmount()`

  `int`

  `getItemCapacity()`

  `float`

  `getItemUses(InputScript inputScript)`

  `float`

  `getItemUsesAmount()`

  `float`

  `getItemUsesCapacity()`

  `double`

  `getProgress()`

  `Resources`

  `getResourcesComponent()`

  `ResourceType`

  `getType()`

  `boolean`

  `hasFlag(ResourceFlag flag)`

  `boolean`

  `isAutoDecay()`

  `boolean`

  `isDirty()`

  `abstract boolean`

  `isEmpty()`

  `abstract boolean`

  `isFull()`

  `boolean`

  `isLocked()`

  `boolean`

  `isTemporary()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `(package private) void`

  `loadBlueprint(ResourceBlueprint bp)`

  `void`

  `loadSync(ByteBuffer input,
  int worldVersion)`

  `final InventoryItem`

  `offerItem(InventoryItem item)`

  `InventoryItem`

  `offerItem(InventoryItem item,
  boolean ignoreFilters)`

  `InventoryItem`

  `offerItem(InventoryItem item,
  boolean ignoreFilters,
  boolean force,
  boolean syncEntity)`

  `InventoryItem`

  `peekItem()`

  `InventoryItem`

  `peekItem(int offset)`

  `InventoryItem`

  `pollItem()`

  `InventoryItem`

  `pollItem(boolean force,
  boolean syncEntity)`

  `protected void`

  `reset()`

  `protected void`

  `resetDirty()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `saveSync(ByteBuffer output)`

  `void`

  `setDirty()`

  `(package private) void`

  `setGroup(zombie.entity.components.resources.ResourceGroup group)`

  `void`

  `setLocked(boolean locked)`

  `void`

  `setProgress(double progress)`

  `(package private) void`

  `setResourcesComponent(Resources resources)`

  `void`

  `sync()`

  `void`

  `tryTransferTo(Resource target)`

  `void`

  `tryTransferTo(Resource target,
  float amount)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### resourcesComponent

    protected [Resources](Resources.html "class in zombie.entity.components.resources") resourcesComponent
  + ### group

    protected zombie.entity.components.resources.ResourceGroup group
  + ### isLocked

    private boolean isLocked
  + ### progress

    private double progress
  + ### id

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### resourceType

    private [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") resourceType
  + ### resourceIo

    private [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") resourceIo
  + ### channel

    private [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel
  + ### flags

    private final zombie.entity.util.enums.EnumBitStore<[ResourceFlag](ResourceFlag.html "enum class in zombie.entity.components.resources")> flags
  + ### filterName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterName
  + ### dirty

    private boolean dirty
* Constructor Details
  -------------------

  + ### Resource

    protected Resource()
* Method Details
  --------------

  + ### setGroup

    void setGroup(zombie.entity.components.resources.ResourceGroup group)
  + ### getGroup

    zombie.entity.components.resources.ResourceGroup getGroup()
  + ### setResourcesComponent

    void setResourcesComponent([Resources](Resources.html "class in zombie.entity.components.resources") resources)
  + ### isDirty

    public boolean isDirty()
  + ### setDirty

    public void setDirty()
  + ### resetDirty

    protected void resetDirty()
  + ### getResourcesComponent

    public [Resources](Resources.html "class in zombie.entity.components.resources") getResourcesComponent()
  + ### getGameEntity

    public [GameEntity](../../GameEntity.html "class in zombie.entity") getGameEntity()
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI)
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)
  + ### DoDebugTooltip

    protected void DoDebugTooltip([ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)
  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getType

    public [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") getType()
  + ### getIO

    public [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") getIO()
  + ### getChannel

    public [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") getChannel()
  + ### isAutoDecay

    public boolean isAutoDecay()
  + ### isTemporary

    public boolean isTemporary()
  + ### hasFlag

    public boolean hasFlag([ResourceFlag](ResourceFlag.html "enum class in zombie.entity.components.resources") flag)
  + ### getDebugFlagsString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDebugFlagsString()
  + ### getFilterName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFilterName()
  + ### loadBlueprint

    void loadBlueprint([ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") bp)
  + ### setProgress

    public void setProgress(double progress)
  + ### getProgress

    public double getProgress()
  + ### isLocked

    public boolean isLocked()
  + ### setLocked

    public void setLocked(boolean locked)
  + ### isFull

    public abstract boolean isFull()
  + ### isEmpty

    public abstract boolean isEmpty()
  + ### getItemAmount

    public int getItemAmount()
  + ### getItemUses

    public float getItemUses([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### getFluidAmount

    public float getFluidAmount()
  + ### getEnergyAmount

    public float getEnergyAmount()
  + ### getItemUsesAmount

    public float getItemUsesAmount()
  + ### getItemCapacity

    public int getItemCapacity()
  + ### getFluidCapacity

    public float getFluidCapacity()
  + ### getEnergyCapacity

    public float getEnergyCapacity()
  + ### getItemUsesCapacity

    public float getItemUsesCapacity()
  + ### getFreeItemCapacity

    public int getFreeItemCapacity()
  + ### getFreeFluidCapacity

    public float getFreeFluidCapacity()
  + ### getFreeEnergyCapacity

    public float getFreeEnergyCapacity()
  + ### getFreeItemUsesCapacity

    public float getFreeItemUsesCapacity()
  + ### canMoveItemsToOutput

    public boolean canMoveItemsToOutput()
  + ### containsItem

    public boolean containsItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### acceptsItem

    public final boolean acceptsItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### acceptsItem

    public boolean acceptsItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean ignoreFilters)
  + ### canStackItem

    public boolean canStackItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### canStackItem

    public boolean canStackItem([Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") item)
  + ### offerItem

    public final [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") offerItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### offerItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") offerItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean ignoreFilters)
  + ### offerItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") offerItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean ignoreFilters,
    boolean force,
    boolean syncEntity)
  + ### pollItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") pollItem()
  + ### pollItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") pollItem(boolean force,
    boolean syncEntity)
  + ### peekItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") peekItem()
  + ### peekItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") peekItem(int offset)
  + ### canDrainToItem

    public boolean canDrainToItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### drainToItem

    public boolean drainToItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### canDrainFromItem

    public boolean canDrainFromItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### drainFromItem

    public boolean drainFromItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### tryTransferTo

    public void tryTransferTo([Resource](Resource.html "class in zombie.entity.components.resources") target)
  + ### tryTransferTo

    public void tryTransferTo([Resource](Resource.html "class in zombie.entity.components.resources") target,
    float amount)
  + ### clear

    public abstract void clear()
  + ### reset

    protected void reset()
  + ### saveSync

    public void saveSync([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadSync

    public void loadSync([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### sync

    public void sync()