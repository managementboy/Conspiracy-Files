[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.network.fields.vehicle](package-summary.html)
2. [VehiclePartModData](VehiclePartModData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [VehiclePartModData(VehicleID)](#%3Cinit%3E(zombie.network.fields.vehicle.VehicleID))
6. [Method Details](#method-detail)
   1. [parse(ByteBufferReader, IConnection)](#parse(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   2. [write(ByteBufferWriter)](#write(zombie.core.network.ByteBufferWriter))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class VehiclePartModData
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.fields.vehicle.VehicleField

zombie.network.fields.vehicle.VehiclePartModData

All Implemented Interfaces:
:   `zombie.network.fields.INetworkPacketField, zombie.network.packets.IDescriptor`

---

public class VehiclePartModData
extends zombie.network.fields.vehicle.VehicleField
implements zombie.network.fields.INetworkPacketField

* Field Summary
  -------------

  ### Fields inherited from class zombie.network.fields.vehicle.VehicleField

  `vehicleID`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehiclePartModData(zombie.network.fields.vehicle.VehicleID vehicleID)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `parse(zombie.core.network.ByteBufferReader bb,
  zombie.network.IConnection connection)`

  Format:
  byte - numParts
  short - totalPartBytes
  part[numParts]
  byte - 255
  part:
  byte - partIndex
  short - lengthOfModData
  bytes[lengthOfModData] - modData

  `void`

  `write(zombie.core.network.ByteBufferWriter b)`

  Format:
  byte - numParts
  short - totalPartBytes
  part[numParts]
  byte - 255
  part:
  byte - partIndex
  short - lengthOfModData
  bytes[lengthOfModData] - modData

  ### Methods inherited from class zombie.network.fields.vehicle.VehicleField

  `getVehicle`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.network.packets.IDescriptor

  `getClassDescription, getDescription, getDescription`

  ### Methods inherited from interface zombie.network.fields.INetworkPacketField

  `getPacketSizeBytes, isConsistent`

* Constructor Details
  -------------------

  + ### VehiclePartModData

    public VehiclePartModData(zombie.network.fields.vehicle.VehicleID vehicleID)
* Method Details
  --------------

  + ### parse

    public void parse(zombie.core.network.ByteBufferReader bb,
    zombie.network.IConnection connection)

    ```
    Format:
         byte - numParts
         short - totalPartBytes
         part[numParts]
         byte - 255

     part:
         byte - partIndex
         short - lengthOfModData
         bytes[lengthOfModData] - modData
    ```

    Specified by:
    :   `parse` in interface `zombie.network.fields.INetworkPacketField`
  + ### write

    public void write(zombie.core.network.ByteBufferWriter b)

    ```
    Format:
         byte - numParts
         short - totalPartBytes
         part[numParts]
         byte - 255

     part:
         byte - partIndex
         short - lengthOfModData
         bytes[lengthOfModData] - modData
    ```

    Specified by:
    :   `write` in interface `zombie.network.fields.INetworkPacketField`