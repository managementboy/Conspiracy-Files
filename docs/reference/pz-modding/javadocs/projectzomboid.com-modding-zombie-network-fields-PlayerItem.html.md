[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.network.fields](package-summary.html)
2. [PlayerItem](PlayerItem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [item](#item)
6. [Constructor Details](#constructor-detail)
   1. [PlayerItem()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(InventoryItem)](#set(zombie.inventory.InventoryItem))
   2. [parse(ByteBufferReader, IConnection)](#parse(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   3. [write(ByteBufferWriter)](#write(zombie.core.network.ByteBufferWriter))
   4. [isConsistent(IConnection)](#isConsistent(zombie.network.IConnection))
   5. [getItem()](#getItem())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PlayerItem
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.fields.IDShort

zombie.network.fields.PlayerItem

All Implemented Interfaces:
:   `zombie.network.fields.INetworkPacketField, zombie.network.packets.IDescriptor`

---

public class PlayerItem
extends zombie.network.fields.IDShort
implements zombie.network.fields.INetworkPacketField

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected InventoryItem`

  `item`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PlayerItem()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `InventoryItem`

  `getItem()`

  `boolean`

  `isConsistent(zombie.network.IConnection connection)`

  `void`

  `parse(zombie.core.network.ByteBufferReader b,
  zombie.network.IConnection connection)`

  `void`

  `set(InventoryItem item)`

  `void`

  `write(zombie.core.network.ByteBufferWriter b)`

  ### Methods inherited from class zombie.network.fields.IDShort

  `getID, setID, write`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.network.packets.IDescriptor

  `getClassDescription, getDescription, getDescription`

  ### Methods inherited from interface zombie.network.fields.INetworkPacketField

  `getPacketSizeBytes`

* Field Details
  -------------

  + ### item

    protected [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item
* Constructor Details
  -------------------

  + ### PlayerItem

    public PlayerItem()
* Method Details
  --------------

  + ### set

    public void set([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### parse

    public void parse(zombie.core.network.ByteBufferReader b,
    zombie.network.IConnection connection)

    Specified by:
    :   `parse` in interface `zombie.network.fields.INetworkPacketField`

    Overrides:
    :   `parse` in class `zombie.network.fields.IDShort`
  + ### write

    public void write(zombie.core.network.ByteBufferWriter b)

    Specified by:
    :   `write` in interface `zombie.network.fields.INetworkPacketField`

    Overrides:
    :   `write` in class `zombie.network.fields.IDShort`
  + ### isConsistent

    public boolean isConsistent(zombie.network.IConnection connection)

    Specified by:
    :   `isConsistent` in interface `zombie.network.fields.INetworkPacketField`

    Overrides:
    :   `isConsistent` in class `zombie.network.fields.IDShort`
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem()