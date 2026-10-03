[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [VehicleParts](VehicleParts.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [owner](#owner)
   2. [parts](#parts)
   3. [partsById](#partsById)
   4. [battery](#battery)
   5. [engine](#engine)
6. [Constructor Details](#constructor-detail)
   1. [VehicleParts()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setOwner(VehiclePartOwner)](#setOwner(zombie.vehicles.VehiclePartOwner))
   2. [getOwner()](#getOwner())
   3. [getVehicle()](#getVehicle())
   4. [getScript()](#getScript())
   5. [clear()](#clear())
   6. [size()](#size())
   7. [isEmpty()](#isEmpty())
   8. [contains(VehiclePart)](#contains(zombie.vehicles.VehiclePart))
   9. [indexOf(VehiclePart)](#indexOf(zombie.vehicles.VehiclePart))
   10. [add(VehiclePart)](#add(zombie.vehicles.VehiclePart))
   11. [get(int)](#get(int))
   12. [getPartCount()](#getPartCount())
   13. [getPartByIndex(int)](#getPartByIndex(int))
   14. [getPartByPartId(VehiclePart)](#getPartByPartId(zombie.scripting.objects.VehiclePart))
   15. [getPartById(String)](#getPartById(java.lang.String))
   16. [getPartIndex(String)](#getPartIndex(java.lang.String))
   17. [getNumberOfPartsWithContainers()](#getNumberOfPartsWithContainers())
   18. [getBattery()](#getBattery())
   19. [getBatteryCharge()](#getBatteryCharge())
   20. [getEngine()](#getEngine())
   21. [getEngineCondition()](#getEngineCondition())
   22. [isEngineWorking()](#isEngineWorking())
   23. [getTrunkDoorPart()](#getTrunkDoorPart())
   24. [getTrunkPart()](#getTrunkPart())
   25. [getTrailerTrunkPart()](#getTrailerTrunkPart())
   26. [getPartForSeatContainer(int)](#getPartForSeatContainer(int))
   27. [getVehicleItemContainers(T, Invokers.Params2.Boolean.ICallback)](#getVehicleItemContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback))
   28. [getVehicleItemContainers(T, Invokers.Params2.Boolean.ICallback, PZArrayList)](#getVehicleItemContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,zombie.util.list.PZArrayList))
   29. [createParts()](#createParts())
   30. [isPartMissingUninstallableItem(VehiclePart)](#isPartMissingUninstallableItem(zombie.vehicles.VehiclePart))
   31. [shouldPartHaveNoItem(VehiclePart)](#shouldPartHaveNoItem(zombie.vehicles.VehiclePart))
   32. [initParts()](#initParts())
   33. [setScript(VehicleScript)](#setScript(zombie.scripting.objects.VehicleScript))
   34. [updatePart(VehiclePart)](#updatePart(zombie.vehicles.VehiclePart))
   35. [update()](#update())
   36. [addToWorld()](#addToWorld())
   37. [removeFromWorld()](#removeFromWorld())
   38. [callLuaVoid(String, Object, Object)](#callLuaVoid(java.lang.String,java.lang.Object,java.lang.Object))
   39. [callLuaVoid(String, Object)](#callLuaVoid(java.lang.String,java.lang.Object))
   40. [callLuaVoid(String, Object, Object, Object)](#callLuaVoid(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))
   41. [callLuaBoolean(String, Object, Object)](#callLuaBoolean(java.lang.String,java.lang.Object,java.lang.Object))
   42. [callLuaBoolean(String, Object, Object, Object)](#callLuaBoolean(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class VehicleParts
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.VehicleParts

---

public final class VehicleParts
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private VehiclePart`

  `battery`

  `private VehiclePart`

  `engine`

  `private zombie.vehicles.VehiclePartOwner`

  `owner`

  `private final List<VehiclePart>`

  `parts`

  `private final Map<String, VehiclePart>`

  `partsById`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehicleParts()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(VehiclePart part)`

  `void`

  `addToWorld()`

  `private Boolean`

  `callLuaBoolean(String functionName,
  Object arg,
  Object arg2)`

  `private Boolean`

  `callLuaBoolean(String functionName,
  Object arg,
  Object arg2,
  Object arg3)`

  `private void`

  `callLuaVoid(String functionName,
  Object arg1)`

  `private void`

  `callLuaVoid(String functionName,
  Object arg1,
  Object arg2)`

  `private void`

  `callLuaVoid(String functionName,
  Object arg1,
  Object arg2,
  Object arg3)`

  `void`

  `clear()`

  `boolean`

  `contains(VehiclePart part)`

  `void`

  `createParts()`

  `VehiclePart`

  `get(int index)`

  `VehiclePart`

  `getBattery()`

  `float`

  `getBatteryCharge()`

  `VehiclePart`

  `getEngine()`

  `int`

  `getEngineCondition()`

  `int`

  `getNumberOfPartsWithContainers()`

  `zombie.vehicles.VehiclePartOwner`

  `getOwner()`

  `VehiclePart`

  `getPartById(String id)`

  `VehiclePart`

  `getPartByIndex(int index)`

  `VehiclePart`

  `getPartByPartId(VehiclePart id)`

  `int`

  `getPartCount()`

  `VehiclePart`

  `getPartForSeatContainer(int seat)`

  `int`

  `getPartIndex(String id)`

  `VehicleScript`

  `getScript()`

  `VehiclePart`

  `getTrailerTrunkPart()`

  `VehiclePart`

  `getTrunkDoorPart()`

  `VehiclePart`

  `getTrunkPart()`

  `BaseVehicle`

  `getVehicle()`

  `<T> PZArrayList<ItemContainer>`

  `getVehicleItemContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate)`

  `<T> PZArrayList<ItemContainer>`

  `getVehicleItemContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate,
  PZArrayList<ItemContainer> containerList)`

  `int`

  `indexOf(VehiclePart part)`

  `void`

  `initParts()`

  `boolean`

  `isEmpty()`

  `boolean`

  `isEngineWorking()`

  `private boolean`

  `isPartMissingUninstallableItem(VehiclePart part)`

  `void`

  `removeFromWorld()`

  `void`

  `setOwner(zombie.vehicles.VehiclePartOwner owner)`

  `void`

  `setScript(VehicleScript script)`

  `private boolean`

  `shouldPartHaveNoItem(VehiclePart part)`

  `int`

  `size()`

  `boolean`

  `update()`

  `boolean`

  `updatePart(VehiclePart part)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### owner

    private zombie.vehicles.VehiclePartOwner owner
  + ### parts

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[VehiclePart](VehiclePart.html "class in zombie.vehicles")> parts
  + ### partsById

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [VehiclePart](VehiclePart.html "class in zombie.vehicles")> partsById
  + ### battery

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") battery
  + ### engine

    private [VehiclePart](VehiclePart.html "class in zombie.vehicles") engine
* Constructor Details
  -------------------

  + ### VehicleParts

    public VehicleParts()
* Method Details
  --------------

  + ### setOwner

    public void setOwner(zombie.vehicles.VehiclePartOwner owner)
  + ### getOwner

    public zombie.vehicles.VehiclePartOwner getOwner()
  + ### getVehicle

    public [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") getVehicle()
  + ### getScript

    public [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") getScript()
  + ### clear

    public void clear()
  + ### size

    public int size()
  + ### isEmpty

    public boolean isEmpty()
  + ### contains

    public boolean contains([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### indexOf

    public int indexOf([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### add

    public void add([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### get

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") get(int index)
  + ### getPartCount

    public int getPartCount()
  + ### getPartByIndex

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getPartByIndex(int index)
  + ### getPartByPartId

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getPartByPartId([VehiclePart](../scripting/objects/VehiclePart.html "enum class in zombie.scripting.objects") id)
  + ### getPartById

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getPartById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getPartIndex

    public int getPartIndex([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getNumberOfPartsWithContainers

    public int getNumberOfPartsWithContainers()
  + ### getBattery

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getBattery()
  + ### getBatteryCharge

    public float getBatteryCharge()
  + ### getEngine

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getEngine()
  + ### getEngineCondition

    public int getEngineCondition()
  + ### isEngineWorking

    public boolean isEngineWorking()
  + ### getTrunkDoorPart

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getTrunkDoorPart()
  + ### getTrunkPart

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getTrunkPart()
  + ### getTrailerTrunkPart

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getTrailerTrunkPart()
  + ### getPartForSeatContainer

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getPartForSeatContainer(int seat)
  + ### getVehicleItemContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getVehicleItemContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate)
  + ### getVehicleItemContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getVehicleItemContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> containerList)
  + ### createParts

    public void createParts()
  + ### isPartMissingUninstallableItem

    private boolean isPartMissingUninstallableItem([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### shouldPartHaveNoItem

    private boolean shouldPartHaveNoItem([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### initParts

    public void initParts()
  + ### setScript

    public void setScript([VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") script)
  + ### updatePart

    public boolean updatePart([VehiclePart](VehiclePart.html "class in zombie.vehicles") part)
  + ### update

    public boolean update()
  + ### addToWorld

    public void addToWorld()
  + ### removeFromWorld

    public void removeFromWorld()
  + ### callLuaVoid

    private void callLuaVoid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2)
  + ### callLuaVoid

    private void callLuaVoid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1)
  + ### callLuaVoid

    private void callLuaVoid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg3)
  + ### callLuaBoolean

    private [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") callLuaBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2)
  + ### callLuaBoolean

    private [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") callLuaBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg3)