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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [nextIsoMarkerId](#nextIsoMarkerId)
   3. [markers](#markers)
7. [Constructor Details](#constructor-detail)
   1. [IsoMarkers()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [update()](#update())
   3. [removeIsoMarker(IsoMarkers.IsoMarker)](#removeIsoMarker(zombie.iso.IsoMarkers.IsoMarker))
   4. [removeIsoMarker(int)](#removeIsoMarker(int))
   5. [getIsoMarker(int)](#getIsoMarker(int))
   6. [addIsoMarker(String, IsoGridSquare, float, float, float, float)](#addIsoMarker(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,float))
   7. [addIsoMarker(KahluaTable, IsoGridSquare, float, float, float, float)](#addIsoMarker(se.krka.kahlua.vm.KahluaTable,zombie.iso.IsoGridSquare,float,float,float,float))
   8. [addIsoMarker(InventoryItem, IsoGridSquare, float, float, float, float, float)](#addIsoMarker(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,float,float,float,float,float))
   9. [renderIsoMarkers(IsoCell.PerPlayerRender, int, int)](#renderIsoMarkers(zombie.iso.IsoCell.PerPlayerRender,int,int))
   10. [render()](#render())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoMarkers
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoMarkers

---

public final class IsoMarkers
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `IsoMarkers.IsoMarker`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final IsoMarkers`

  `instance`

  `private final List<IsoMarkers.IsoMarker>`

  `markers`

  `private static int`

  `nextIsoMarkerId`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `IsoMarkers()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `IsoMarkers.IsoMarker`

  `addIsoMarker(String spriteName,
  IsoGridSquare gs,
  float r,
  float g,
  float b,
  float alpha)`

  `IsoMarkers.IsoMarker`

  `addIsoMarker(se.krka.kahlua.vm.KahluaTable textureTable,
  IsoGridSquare gs,
  float r,
  float g,
  float b,
  float alpha)`

  `IsoMarkers.IsoMarker`

  `addIsoMarker(InventoryItem item,
  IsoGridSquare gs,
  float r,
  float g,
  float b,
  float alpha,
  float rotation)`

  `IsoMarkers.IsoMarker`

  `getIsoMarker(int id)`

  `boolean`

  `removeIsoMarker(int id)`

  `boolean`

  `removeIsoMarker(IsoMarkers.IsoMarker marker)`

  `void`

  `render()`

  `void`

  `renderIsoMarkers(IsoCell.PerPlayerRender perPlayerRender,
  int zLayer,
  int playerIndex)`

  `void`

  `reset()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [IsoMarkers](IsoMarkers.html "class in zombie.iso") instance
  + ### nextIsoMarkerId

    private static int nextIsoMarkerId
  + ### markers

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoMarkers.IsoMarker](IsoMarkers.IsoMarker.html "class in zombie.iso")> markers
* Constructor Details
  -------------------

  + ### IsoMarkers

    private IsoMarkers()
* Method Details
  --------------

  + ### reset

    public void reset()
  + ### update

    public void update()
  + ### removeIsoMarker

    public boolean removeIsoMarker([IsoMarkers.IsoMarker](IsoMarkers.IsoMarker.html "class in zombie.iso") marker)
  + ### removeIsoMarker

    public boolean removeIsoMarker(int id)
  + ### getIsoMarker

    public [IsoMarkers.IsoMarker](IsoMarkers.IsoMarker.html "class in zombie.iso") getIsoMarker(int id)
  + ### addIsoMarker

    public [IsoMarkers.IsoMarker](IsoMarkers.IsoMarker.html "class in zombie.iso") addIsoMarker([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gs,
    float r,
    float g,
    float b,
    float alpha)
  + ### addIsoMarker

    public [IsoMarkers.IsoMarker](IsoMarkers.IsoMarker.html "class in zombie.iso") addIsoMarker(se.krka.kahlua.vm.KahluaTable textureTable,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gs,
    float r,
    float g,
    float b,
    float alpha)
  + ### addIsoMarker

    public [IsoMarkers.IsoMarker](IsoMarkers.IsoMarker.html "class in zombie.iso") addIsoMarker([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gs,
    float r,
    float g,
    float b,
    float alpha,
    float rotation)
  + ### renderIsoMarkers

    public void renderIsoMarkers([IsoCell.PerPlayerRender](IsoCell.PerPlayerRender.html "class in zombie.iso") perPlayerRender,
    int zLayer,
    int playerIndex)
  + ### render

    public void render()