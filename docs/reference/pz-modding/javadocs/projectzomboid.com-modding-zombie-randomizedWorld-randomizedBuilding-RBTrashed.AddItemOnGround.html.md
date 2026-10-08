[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.randomizedWorld.randomizedBuilding](package-summary.html)
2. [RBTrashed](RBTrashed.html)
3. [AddItemOnGround](RBTrashed.AddItemOnGround.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [square](#square)
   2. [item](#item)
6. [Constructor Details](#constructor-detail)
   1. [AddItemOnGround(IsoGridSquare, InventoryItem)](#%3Cinit%3E(zombie.iso.IsoGridSquare,zombie.inventory.InventoryItem))
7. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [hashCode()](#hashCode())
   3. [equals(Object)](#equals(java.lang.Object))
   4. [square()](#square())
   5. [item()](#item())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Record Class RBTrashed.AddItemOnGround
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

zombie.randomizedWorld.randomizedBuilding.RBTrashed.AddItemOnGround

Enclosing class:
:   `RBTrashed`

---

private static record RBTrashed.AddItemOnGround([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square, [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
extends [Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final InventoryItem`

  `item`

  The field for the `item` record component.

  `private final IsoGridSquare`

  `square`

  The field for the `square` record component.
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `AddItemOnGround(IsoGridSquare square,
  InventoryItem item)`

  Creates an instance of a `AddItemOnGround` record class.
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `final boolean`

  `equals(Object o)`

  Indicates whether some other object is "equal to" this one.

  `final int`

  `hashCode()`

  Returns a hash code value for this object.

  `InventoryItem`

  `item()`

  Returns the value of the `item` record component.

  `IsoGridSquare`

  `square()`

  Returns the value of the `square` record component.

  `final String`

  `toString()`

  Returns a string representation of this record class.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### square

    private final [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square

    The field for the `square` record component.
  + ### item

    private final [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item

    The field for the `item` record component.
* Constructor Details
  -------------------

  + ### AddItemOnGround

    private AddItemOnGround([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Creates an instance of a `AddItemOnGround` record class.

    Parameters:
    :   `square` - the value for the `square` record component
    :   `item` - the value for the `item` record component
* Method Details
  --------------

  + ### toString

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Returns a string representation of this record class. The representation contains the name of the class, followed by the name and value of each of the record components.

    Specified by:
    :   `toString` in class `Record`

    Returns:
    :   a string representation of this object
  + ### hashCode

    public final int hashCode()

    Returns a hash code value for this object. The value is derived from the hash code of each of the record components.

    Specified by:
    :   `hashCode` in class `Record`

    Returns:
    :   a hash code value for this object
  + ### equals

    public final boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Indicates whether some other object is "equal to" this one. The objects are equal if the other object is of the same class and if all the record components are equal. All components in this record class are compared with [`Objects::equals(Object,Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Objects.html#equals(java.lang.Object,java.lang.Object) "class or interface in java.util").

    Specified by:
    :   `equals` in class `Record`

    Parameters:
    :   `o` - the object with which to compare

    Returns:
    :   `true` if this object is the same as the `o` argument; `false` otherwise.
  + ### square

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square()

    Returns the value of the `square` record component.

    Returns:
    :   the value of the `square` record component
  + ### item

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item()

    Returns the value of the `item` record component.

    Returns:
    :   the value of the `item` record component