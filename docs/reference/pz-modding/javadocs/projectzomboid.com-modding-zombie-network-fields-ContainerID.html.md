[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.network.fields](package-summary.html)
2. [ContainerID](ContainerID.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [playerId](#playerId)
   2. [containerType](#containerType)
   3. [x](#x)
   4. [y](#y)
   5. [z](#z)
   6. [index](#index)
   7. [containerIndex](#containerIndex)
   8. [vid](#vid)
   9. [worldItemId](#worldItemId)
   10. [floorXY](#floorXY)
   11. [container](#container)
   12. [object](#object)
7. [Constructor Details](#constructor-detail)
   1. [ContainerID()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getContainerType()](#getContainerType())
   2. [set(ItemContainer)](#set(zombie.inventory.ItemContainer))
   3. [copy(ContainerID)](#copy(zombie.network.fields.ContainerID))
   4. [setFloor(ItemContainer, IsoGridSquare)](#setFloor(zombie.inventory.ItemContainer,zombie.iso.IsoGridSquare))
   5. [setObject(ItemContainer, IsoObject, IsoGridSquare)](#setObject(zombie.inventory.ItemContainer,zombie.iso.IsoObject,zombie.iso.IsoGridSquare))
   6. [setObjectInVehicle(ItemContainer, IsoObject, IsoGridSquare, ItemContainer)](#setObjectInVehicle(zombie.inventory.ItemContainer,zombie.iso.IsoObject,zombie.iso.IsoGridSquare,zombie.inventory.ItemContainer))
   7. [setInventoryContainer(ItemContainer, IsoPlayer)](#setInventoryContainer(zombie.inventory.ItemContainer,zombie.characters.IsoPlayer))
   8. [set(ItemContainer, IsoObject)](#set(zombie.inventory.ItemContainer,zombie.iso.IsoObject))
   9. [isContainerTheSame(int, ItemContainer)](#isContainerTheSame(int,zombie.inventory.ItemContainer))
   10. [getContainer()](#getContainer())
   11. [getObject()](#getObject())
   12. [getPart()](#getPart())
   13. [getVehicle()](#getVehicle())
   14. [parse(ByteBufferReader, IConnection)](#parse(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   15. [write(ByteBufferWriter)](#write(zombie.core.network.ByteBufferWriter))
   16. [write(ByteBuffer)](#write(java.nio.ByteBuffer))
   17. [findObject()](#findObject())
   18. [equals(Object)](#equals(java.lang.Object))
   19. [hashCode()](#hashCode())
   20. [toString()](#toString())
   21. [contains(int[], int, int)](#contains(int%5B%5D,int,int))
   22. [addFloorXY(int, int, int[])](#addFloorXY(int,int,int%5B%5D))
   23. [calculateFloorXY(ItemContainer)](#calculateFloorXY(zombie.inventory.ItemContainer))
   24. [collectFloorItems(IsoGridSquare)](#collectFloorItems(zombie.iso.IsoGridSquare))
   25. [getFloorContainer(ItemContainer)](#getFloorContainer(zombie.inventory.ItemContainer))
   26. [getFloorSquare(ItemContainer)](#getFloorSquare(zombie.inventory.ItemContainer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ContainerID
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.fields.ContainerID

All Implemented Interfaces:
:   `zombie.network.fields.INetworkPacketField, zombie.network.packets.IDescriptor`

---

public class ContainerID
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.network.fields.INetworkPacketField

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `ContainerID.ContainerType`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) ItemContainer`

  `container`

  `(package private) short`

  `containerIndex`

  `ContainerID.ContainerType`

  `containerType`

  `int[]`

  `floorXY`

  `(package private) short`

  `index`

  `(package private) IsoObject`

  `object`

  `final zombie.network.fields.character.PlayerID`

  `playerId`

  `(package private) short`

  `vid`

  `int`

  `worldItemId`

  `int`

  `x`

  `int`

  `y`

  `byte`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ContainerID()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private int[]`

  `addFloorXY(int x,
  int y,
  int[] floorXY)`

  `private void`

  `calculateFloorXY(ItemContainer container)`

  `private void`

  `collectFloorItems(IsoGridSquare sq)`

  `private boolean`

  `contains(int[] floorXY,
  int x,
  int y)`

  `void`

  `copy(ContainerID other)`

  `boolean`

  `equals(Object o)`

  `void`

  `findObject()`

  `ItemContainer`

  `getContainer()`

  `ContainerID.ContainerType`

  `getContainerType()`

  `private ItemContainer`

  `getFloorContainer(ItemContainer container)`

  `private IsoGridSquare`

  `getFloorSquare(ItemContainer floorContainer)`

  `IsoObject`

  `getObject()`

  `VehiclePart`

  `getPart()`

  `BaseVehicle`

  `getVehicle()`

  `int`

  `hashCode()`

  `boolean`

  `isContainerTheSame(int itemId,
  ItemContainer source)`

  `void`

  `parse(zombie.core.network.ByteBufferReader b,
  zombie.network.IConnection connection)`

  `void`

  `set(ItemContainer container)`

  `void`

  `set(ItemContainer container,
  IsoObject o)`

  `void`

  `setFloor(ItemContainer container,
  IsoGridSquare sq)`

  `void`

  `setInventoryContainer(ItemContainer container,
  IsoPlayer player)`

  `void`

  `setObject(ItemContainer container,
  IsoObject o,
  IsoGridSquare sq)`

  `void`

  `setObjectInVehicle(ItemContainer container,
  IsoObject o,
  IsoGridSquare sq,
  ItemContainer part)`

  `String`

  `toString()`

  `void`

  `write(ByteBuffer bb)`

  `void`

  `write(zombie.core.network.ByteBufferWriter b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.network.packets.IDescriptor

  `getClassDescription, getDescription, getDescription`

  ### Methods inherited from interface zombie.network.fields.INetworkPacketField

  `getPacketSizeBytes, isConsistent`

* Field Details
  -------------

  + ### playerId

    public final zombie.network.fields.character.PlayerID playerId
  + ### containerType

    public [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") containerType
  + ### x

    public int x
  + ### y

    public int y
  + ### z

    public byte z
  + ### index

    short index
  + ### containerIndex

    short containerIndex
  + ### vid

    short vid
  + ### worldItemId

    public int worldItemId
  + ### floorXY

    public int[] floorXY
  + ### container

    [ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container
  + ### object

    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") object
* Constructor Details
  -------------------

  + ### ContainerID

    public ContainerID()
* Method Details
  --------------

  + ### getContainerType

    public [ContainerID.ContainerType](ContainerID.ContainerType.html "enum class in zombie.network.fields") getContainerType()
  + ### set

    public void set([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### copy

    public void copy([ContainerID](ContainerID.html "class in zombie.network.fields") other)
  + ### setFloor

    public void setFloor([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### setObject

    public void setObject([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") o,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### setObjectInVehicle

    public void setObjectInVehicle([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") o,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") part)
  + ### setInventoryContainer

    public void setInventoryContainer([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### set

    public void set([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") o)
  + ### isContainerTheSame

    public boolean isContainerTheSame(int itemId,
    [ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") source)
  + ### getContainer

    public [ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") getContainer()
  + ### getObject

    public [IsoObject](../../iso/IsoObject.html "class in zombie.iso") getObject()
  + ### getPart

    public [VehiclePart](../../vehicles/VehiclePart.html "class in zombie.vehicles") getPart()
  + ### getVehicle

    public [BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") getVehicle()
  + ### parse

    public void parse(zombie.core.network.ByteBufferReader b,
    zombie.network.IConnection connection)

    Specified by:
    :   `parse` in interface `zombie.network.fields.INetworkPacketField`
  + ### write

    public void write(zombie.core.network.ByteBufferWriter b)

    Specified by:
    :   `write` in interface `zombie.network.fields.INetworkPacketField`
  + ### write

    public void write([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
  + ### findObject

    public void findObject()
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Overrides:
    :   `equals` in class `Object`
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### contains

    private boolean contains(int[] floorXY,
    int x,
    int y)
  + ### addFloorXY

    private int[] addFloorXY(int x,
    int y,
    int[] floorXY)
  + ### calculateFloorXY

    private void calculateFloorXY([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### collectFloorItems

    private void collectFloorItems([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### getFloorContainer

    private [ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") getFloorContainer([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### getFloorSquare

    private [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getFloorSquare([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") floorContainer)