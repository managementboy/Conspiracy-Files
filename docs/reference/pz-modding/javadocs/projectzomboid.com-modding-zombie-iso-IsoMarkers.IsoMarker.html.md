[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoMarkers](IsoMarkers.html)
3. [IsoMarker](IsoMarkers.IsoMarker.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [textures](#textures)
   3. [square](#square)
   4. [x](#x)
   5. [y](#y)
   6. [z](#z)
   7. [zLayer](#zLayer)
   8. [r](#r)
   9. [g](#g)
   10. [b](#b)
   11. [a](#a)
   12. [active](#active)
   13. [isRemoved](#isRemoved)
   14. [item](#item)
   15. [rotation](#rotation)
   16. [circleSize](#circleSize)
6. [Constructor Details](#constructor-detail)
   1. [IsoMarker()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [remove()](#remove())
   3. [isRemoved()](#isRemoved())
   4. [init(KahluaTable, int, int, int, IsoGridSquare)](#init(se.krka.kahlua.vm.KahluaTable,int,int,int,zombie.iso.IsoGridSquare))
   5. [init(String, int, int, int, IsoGridSquare)](#init(java.lang.String,int,int,int,zombie.iso.IsoGridSquare))
   6. [init(InventoryItem, int, int, int, IsoGridSquare)](#init(zombie.inventory.InventoryItem,int,int,int,zombie.iso.IsoGridSquare))
   7. [getX()](#getX())
   8. [getY()](#getY())
   9. [getZ()](#getZ())
   10. [getR()](#getR())
   11. [getG()](#getG())
   12. [getB()](#getB())
   13. [getA()](#getA())
   14. [setR(float)](#setR(float))
   15. [setG(float)](#setG(float))
   16. [setB(float)](#setB(float))
   17. [setA(float)](#setA(float))
   18. [setAlpha(float)](#setAlpha(float))
   19. [getSquare()](#getSquare())
   20. [setSquare(IsoGridSquare)](#setSquare(zombie.iso.IsoGridSquare))
   21. [setPos(int, int, int)](#setPos(int,int,int))
   22. [isActive()](#isActive())
   23. [setActive(boolean)](#setActive(boolean))
   24. [setRotation(float)](#setRotation(float))
   25. [getCircleSize()](#getCircleSize())
   26. [setCircleSize(float)](#setCircleSize(float))
   27. [setColor(float, float, float, float)](#setColor(float,float,float,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoMarkers.IsoMarker
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoMarkers.IsoMarker

Enclosing class:
:   `IsoMarkers`

---

public static final class IsoMarkers.IsoMarker
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `a`

  `private boolean`

  `active`

  `private float`

  `b`

  `private float`

  `circleSize`

  `private float`

  `g`

  `private final int`

  `id`

  `private boolean`

  `isRemoved`

  `private InventoryItem`

  `item`

  `private float`

  `r`

  `private float`

  `rotation`

  `private IsoGridSquare`

  `square`

  `private final ArrayList<Texture>`

  `textures`

  `private float`

  `x`

  `private float`

  `y`

  `private float`

  `z`

  `private int`

  `zLayer`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoMarker()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getA()`

  `float`

  `getB()`

  `float`

  `getCircleSize()`

  `float`

  `getG()`

  `int`

  `getID()`

  `float`

  `getR()`

  `IsoGridSquare`

  `getSquare()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `void`

  `init(String spriteName,
  int x,
  int y,
  int z,
  IsoGridSquare gs)`

  `void`

  `init(se.krka.kahlua.vm.KahluaTable textureTable,
  int x,
  int y,
  int z,
  IsoGridSquare gs)`

  `void`

  `init(InventoryItem item,
  int x,
  int y,
  int z,
  IsoGridSquare gs)`

  `boolean`

  `isActive()`

  `boolean`

  `isRemoved()`

  `void`

  `remove()`

  `void`

  `setA(float a)`

  `void`

  `setActive(boolean active)`

  `void`

  `setAlpha(float alpha)`

  `void`

  `setB(float b)`

  `void`

  `setCircleSize(float size)`

  `void`

  `setColor(float r,
  float g,
  float b,
  float a)`

  `void`

  `setG(float g)`

  `void`

  `setPos(int x,
  int y,
  int z)`

  `void`

  `setR(float r)`

  `void`

  `setRotation(float rotation)`

  `void`

  `setSquare(IsoGridSquare square)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final int id
  + ### textures

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Texture](../core/textures/Texture.html "class in zombie.core.textures")> textures
  + ### square

    private [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square
  + ### x

    private float x
  + ### y

    private float y
  + ### z

    private float z
  + ### zLayer

    private int zLayer
  + ### r

    private float r
  + ### g

    private float g
  + ### b

    private float b
  + ### a

    private float a
  + ### active

    private boolean active
  + ### isRemoved

    private boolean isRemoved
  + ### item

    private [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item
  + ### rotation

    private float rotation
  + ### circleSize

    private float circleSize
* Constructor Details
  -------------------

  + ### IsoMarker

    public IsoMarker()
* Method Details
  --------------

  + ### getID

    public int getID()
  + ### remove

    public void remove()
  + ### isRemoved

    public boolean isRemoved()
  + ### init

    public void init(se.krka.kahlua.vm.KahluaTable textureTable,
    int x,
    int y,
    int z,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gs)
  + ### init

    public void init([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    int x,
    int y,
    int z,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gs)
  + ### init

    public void init([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    int x,
    int y,
    int z,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gs)
  + ### getX

    public float getX()
  + ### getY

    public float getY()
  + ### getZ

    public float getZ()
  + ### getR

    public float getR()
  + ### getG

    public float getG()
  + ### getB

    public float getB()
  + ### getA

    public float getA()
  + ### setR

    public void setR(float r)
  + ### setG

    public void setG(float g)
  + ### setB

    public void setB(float b)
  + ### setA

    public void setA(float a)
  + ### setAlpha

    public void setAlpha(float alpha)
  + ### getSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getSquare()
  + ### setSquare

    public void setSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### setPos

    public void setPos(int x,
    int y,
    int z)
  + ### isActive

    public boolean isActive()
  + ### setActive

    public void setActive(boolean active)
  + ### setRotation

    public void setRotation(float rotation)
  + ### getCircleSize

    public float getCircleSize()
  + ### setCircleSize

    public void setCircleSize(float size)
  + ### setColor

    public void setColor(float r,
    float g,
    float b,
    float a)