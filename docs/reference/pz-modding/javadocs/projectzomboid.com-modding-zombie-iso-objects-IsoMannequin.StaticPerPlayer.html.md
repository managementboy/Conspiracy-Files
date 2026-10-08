[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoMannequin](IsoMannequin.html)
3. [StaticPerPlayer](IsoMannequin.StaticPerPlayer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [playerIndex](#playerIndex)
   2. [moveable](#moveable)
   3. [failedItem](#failedItem)
   4. [mannequin](#mannequin)
6. [Constructor Details](#constructor-detail)
   1. [StaticPerPlayer(int)](#%3Cinit%3E(int))
7. [Method Details](#method-detail)
   1. [renderMoveableItem(Moveable, int, int, int, IsoDirections)](#renderMoveableItem(zombie.inventory.types.Moveable,int,int,int,zombie.iso.IsoDirections))
   2. [getDirectionFromItem(Moveable)](#getDirectionFromItem(zombie.inventory.types.Moveable))
   3. [checkItem(Moveable)](#checkItem(zombie.inventory.types.Moveable))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoMannequin.StaticPerPlayer
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.objects.IsoMannequin.StaticPerPlayer

Enclosing class:
:   `IsoMannequin`

---

private static final class IsoMannequin.StaticPerPlayer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private Moveable`

  `failedItem`

  `private IsoMannequin`

  `mannequin`

  `private Moveable`

  `moveable`

  `private final int`

  `playerIndex`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `StaticPerPlayer(int playerIndex)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private boolean`

  `checkItem(Moveable item)`

  `private IsoDirections`

  `getDirectionFromItem(Moveable item)`

  `private void`

  `renderMoveableItem(Moveable item,
  int x,
  int y,
  int z,
  IsoDirections dir)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### playerIndex

    private final int playerIndex
  + ### moveable

    private [Moveable](../../inventory/types/Moveable.html "class in zombie.inventory.types") moveable
  + ### failedItem

    private [Moveable](../../inventory/types/Moveable.html "class in zombie.inventory.types") failedItem
  + ### mannequin

    private [IsoMannequin](IsoMannequin.html "class in zombie.iso.objects") mannequin
* Constructor Details
  -------------------

  + ### StaticPerPlayer

    private StaticPerPlayer(int playerIndex)
* Method Details
  --------------

  + ### renderMoveableItem

    private void renderMoveableItem([Moveable](../../inventory/types/Moveable.html "class in zombie.inventory.types") item,
    int x,
    int y,
    int z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir)
  + ### getDirectionFromItem

    private [IsoDirections](../IsoDirections.html "enum class in zombie.iso") getDirectionFromItem([Moveable](../../inventory/types/Moveable.html "class in zombie.inventory.types") item)
  + ### checkItem

    private boolean checkItem([Moveable](../../inventory/types/Moveable.html "class in zombie.inventory.types") item)