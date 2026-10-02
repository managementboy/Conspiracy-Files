[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.resources](package-summary.html)
2. [ResourceFluid](ResourceFluid.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fluidContainer](#fluidContainer)
   2. [fluidFilter](#fluidFilter)
6. [Constructor Details](#constructor-detail)
   1. [ResourceFluid()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [loadBlueprint(ResourceBlueprint)](#loadBlueprint(zombie.entity.components.resources.ResourceBlueprint))
   2. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   3. [DoDebugTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoDebugTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   4. [getFluidContainer()](#getFluidContainer())
   5. [isFull()](#isFull())
   6. [isEmpty()](#isEmpty())
   7. [getFluidAmount()](#getFluidAmount())
   8. [getFluidCapacity()](#getFluidCapacity())
   9. [getFreeFluidCapacity()](#getFreeFluidCapacity())
   10. [getFluidRatio()](#getFluidRatio())
   11. [canDrainToItem(InventoryItem)](#canDrainToItem(zombie.inventory.InventoryItem))
   12. [drainToItem(InventoryItem)](#drainToItem(zombie.inventory.InventoryItem))
   13. [canDrainFromItem(InventoryItem)](#canDrainFromItem(zombie.inventory.InventoryItem))
   14. [drainFromItem(InventoryItem)](#drainFromItem(zombie.inventory.InventoryItem))
   15. [tryTransferTo(Resource)](#tryTransferTo(zombie.entity.components.resources.Resource))
   16. [tryTransferTo(Resource, float)](#tryTransferTo(zombie.entity.components.resources.Resource,float))
   17. [transferTo(ResourceFluid, float)](#transferTo(zombie.entity.components.resources.ResourceFluid,float))
   18. [clear()](#clear())
   19. [reset()](#reset())
   20. [saveSync(ByteBuffer)](#saveSync(java.nio.ByteBuffer))
   21. [loadSync(ByteBuffer, int)](#loadSync(java.nio.ByteBuffer,int))
   22. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   23. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class ResourceFluid
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.resources.Resource](Resource.html "class in zombie.entity.components.resources")

zombie.entity.components.resources.ResourceFluid

---

public class ResourceFluid
extends [Resource](Resource.html "class in zombie.entity.components.resources")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final FluidContainer`

  `fluidContainer`

  `private final FluidFilter`

  `fluidFilter`

  ### Fields inherited from class [Resource](Resource.html#field-summary "class in zombie.entity.components.resources")

  `group, resourcesComponent`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `ResourceFluid()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canDrainFromItem(InventoryItem item)`

  `boolean`

  `canDrainToItem(InventoryItem item)`

  `void`

  `clear()`

  `protected void`

  `DoDebugTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `boolean`

  `drainFromItem(InventoryItem item)`

  `boolean`

  `drainToItem(InventoryItem item)`

  `float`

  `getFluidAmount()`

  `float`

  `getFluidCapacity()`

  `FluidContainer`

  `getFluidContainer()`

  `float`

  `getFluidRatio()`

  `float`

  `getFreeFluidCapacity()`

  `boolean`

  `isEmpty()`

  `boolean`

  `isFull()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `(package private) void`

  `loadBlueprint(ResourceBlueprint bp)`

  `void`

  `loadSync(ByteBuffer input,
  int worldVersion)`

  `protected void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `saveSync(ByteBuffer output)`

  `void`

  `transferTo(ResourceFluid target,
  float transferAmount)`

  `void`

  `tryTransferTo(Resource target)`

  `void`

  `tryTransferTo(Resource target,
  float amount)`

  ### Methods inherited from class [Resource](Resource.html#method-summary "class in zombie.entity.components.resources")

  `acceptsItem, acceptsItem, canMoveItemsToOutput, canStackItem, canStackItem, containsItem, DoTooltip, getChannel, getDebugFlagsString, getEnergyAmount, getEnergyCapacity, getFilterName, getFreeEnergyCapacity, getFreeItemCapacity, getFreeItemUsesCapacity, getGameEntity, getGroup, getId, getIO, getItemAmount, getItemCapacity, getItemUses, getItemUsesAmount, getItemUsesCapacity, getProgress, getResourcesComponent, getType, hasFlag, isAutoDecay, isDirty, isLocked, isTemporary, offerItem, offerItem, offerItem, peekItem, peekItem, pollItem, pollItem, resetDirty, setDirty, setGroup, setLocked, setProgress, setResourcesComponent, sync`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fluidContainer

    private final [FluidContainer](../fluids/FluidContainer.html "class in zombie.entity.components.fluids") fluidContainer
  + ### fluidFilter

    private final [FluidFilter](../fluids/FluidFilter.html "class in zombie.entity.components.fluids") fluidFilter
* Constructor Details
  -------------------

  + ### ResourceFluid

    protected ResourceFluid()
* Method Details
  --------------

  + ### loadBlueprint

    void loadBlueprint([ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") bp)

    Overrides:
    :   `loadBlueprint` in class `Resource`
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
  + ### getFluidContainer

    public [FluidContainer](../fluids/FluidContainer.html "class in zombie.entity.components.fluids") getFluidContainer()
  + ### isFull

    public boolean isFull()

    Specified by:
    :   `isFull` in class `Resource`
  + ### isEmpty

    public boolean isEmpty()

    Specified by:
    :   `isEmpty` in class `Resource`
  + ### getFluidAmount

    public float getFluidAmount()

    Overrides:
    :   `getFluidAmount` in class `Resource`
  + ### getFluidCapacity

    public float getFluidCapacity()

    Overrides:
    :   `getFluidCapacity` in class `Resource`
  + ### getFreeFluidCapacity

    public float getFreeFluidCapacity()

    Overrides:
    :   `getFreeFluidCapacity` in class `Resource`
  + ### getFluidRatio

    public float getFluidRatio()
  + ### canDrainToItem

    public boolean canDrainToItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Overrides:
    :   `canDrainToItem` in class `Resource`
  + ### drainToItem

    public boolean drainToItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Overrides:
    :   `drainToItem` in class `Resource`
  + ### canDrainFromItem

    public boolean canDrainFromItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Overrides:
    :   `canDrainFromItem` in class `Resource`
  + ### drainFromItem

    public boolean drainFromItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Overrides:
    :   `drainFromItem` in class `Resource`
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

    public void transferTo([ResourceFluid](ResourceFluid.html "class in zombie.entity.components.resources") target,
    float transferAmount)
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