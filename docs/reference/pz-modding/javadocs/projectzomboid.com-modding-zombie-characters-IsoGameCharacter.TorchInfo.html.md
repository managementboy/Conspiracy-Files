[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoGameCharacter](IsoGameCharacter.html)
3. [TorchInfo](IsoGameCharacter.TorchInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [TorchInfoPool](#TorchInfoPool)
   2. [tempVector3f](#tempVector3f)
   3. [id](#id)
   4. [x](#x)
   5. [y](#y)
   6. [z](#z)
   7. [r](#r)
   8. [g](#g)
   9. [b](#b)
   10. [angleX](#angleX)
   11. [angleY](#angleY)
   12. [dist](#dist)
   13. [strength](#strength)
   14. [cone](#cone)
   15. [dot](#dot)
   16. [focusing](#focusing)
6. [Constructor Details](#constructor-detail)
   1. [TorchInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [alloc()](#alloc())
   2. [release(IsoGameCharacter.TorchInfo)](#release(zombie.characters.IsoGameCharacter.TorchInfo))
   3. [set(IsoPlayer, InventoryItem)](#set(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   4. [set(VehiclePart)](#set(zombie.vehicles.VehiclePart))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGameCharacter.TorchInfo
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoGameCharacter.TorchInfo

Enclosing class:
:   `IsoGameCharacter`

---

public static class IsoGameCharacter.TorchInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `angleX`

  `float`

  `angleY`

  `float`

  `b`

  `boolean`

  `cone`

  `float`

  `dist`

  `float`

  `dot`

  `int`

  `focusing`

  `float`

  `g`

  `int`

  `id`

  `float`

  `r`

  `float`

  `strength`

  `private static final Vector3f`

  `tempVector3f`

  `private static final zombie.popman.ObjectPool<IsoGameCharacter.TorchInfo>`

  `TorchInfoPool`

  `float`

  `x`

  `float`

  `y`

  `float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TorchInfo()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoGameCharacter.TorchInfo`

  `alloc()`

  `static void`

  `release(IsoGameCharacter.TorchInfo info)`

  `IsoGameCharacter.TorchInfo`

  `set(IsoPlayer p,
  InventoryItem item)`

  `IsoGameCharacter.TorchInfo`

  `set(VehiclePart part)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### TorchInfoPool

    private static final zombie.popman.ObjectPool<[IsoGameCharacter.TorchInfo](IsoGameCharacter.TorchInfo.html "class in zombie.characters")> TorchInfoPool
  + ### tempVector3f

    private static final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") tempVector3f
  + ### id

    public int id
  + ### x

    public float x
  + ### y

    public float y
  + ### z

    public float z
  + ### r

    public float r
  + ### g

    public float g
  + ### b

    public float b
  + ### angleX

    public float angleX
  + ### angleY

    public float angleY
  + ### dist

    public float dist
  + ### strength

    public float strength
  + ### cone

    public boolean cone
  + ### dot

    public float dot
  + ### focusing

    public int focusing
* Constructor Details
  -------------------

  + ### TorchInfo

    public TorchInfo()
* Method Details
  --------------

  + ### alloc

    public static [IsoGameCharacter.TorchInfo](IsoGameCharacter.TorchInfo.html "class in zombie.characters") alloc()
  + ### release

    public static void release([IsoGameCharacter.TorchInfo](IsoGameCharacter.TorchInfo.html "class in zombie.characters") info)
  + ### set

    public [IsoGameCharacter.TorchInfo](IsoGameCharacter.TorchInfo.html "class in zombie.characters") set([IsoPlayer](IsoPlayer.html "class in zombie.characters") p,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### set

    public [IsoGameCharacter.TorchInfo](IsoGameCharacter.TorchInfo.html "class in zombie.characters") set([VehiclePart](../vehicles/VehiclePart.html "class in zombie.vehicles") part)