[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [BrokenFences](BrokenFences.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [unbrokenMap](#unbrokenMap)
   3. [brokenLeftMap](#brokenLeftMap)
   4. [brokenRightMap](#brokenRightMap)
   5. [allMap](#allMap)
7. [Constructor Details](#constructor-detail)
   1. [BrokenFences()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [tableToTiles(KahluaTableImpl)](#tableToTiles(se.krka.kahlua.j2se.KahluaTableImpl))
   3. [tableToTiles(KahluaTable, String)](#tableToTiles(se.krka.kahlua.vm.KahluaTable,java.lang.String))
   4. [addBrokenTiles(KahluaTableImpl)](#addBrokenTiles(se.krka.kahlua.j2se.KahluaTableImpl))
   5. [addDebrisTiles(KahluaTableImpl)](#addDebrisTiles(se.krka.kahlua.j2se.KahluaTableImpl))
   6. [setDestroyed(IsoObject)](#setDestroyed(zombie.iso.IsoObject))
   7. [setDamagedLeft(IsoObject)](#setDamagedLeft(zombie.iso.IsoObject))
   8. [setDamagedRight(IsoObject)](#setDamagedRight(zombie.iso.IsoObject))
   9. [updateSprite(IsoObject, boolean, boolean)](#updateSprite(zombie.iso.IsoObject,boolean,boolean))
   10. [isNW(IsoObject)](#isNW(zombie.iso.IsoObject))
   11. [damageAdjacent(IsoGridSquare, IsoDirections, IsoDirections)](#damageAdjacent(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections,zombie.iso.IsoDirections))
   12. [destroyFence(IsoObject, IsoDirections)](#destroyFence(zombie.iso.IsoObject,zombie.iso.IsoDirections))
   13. [isUnbroken(IsoObject)](#isUnbroken(zombie.iso.IsoObject))
   14. [isBrokenLeft(IsoObject)](#isBrokenLeft(zombie.iso.IsoObject))
   15. [isBrokenRight(IsoObject)](#isBrokenRight(zombie.iso.IsoObject))
   16. [isBreakableObject(IsoObject)](#isBreakableObject(zombie.iso.IsoObject))
   17. [isBreakableSprite(String)](#isBreakableSprite(java.lang.String))
   18. [getBreakableObject(IsoGridSquare, boolean)](#getBreakableObject(zombie.iso.IsoGridSquare,boolean))
   19. [addItems(IsoObject, IsoGridSquare)](#addItems(zombie.iso.IsoObject,zombie.iso.IsoGridSquare))
   20. [addDebrisObject(IsoObject, IsoDirections)](#addDebrisObject(zombie.iso.IsoObject,zombie.iso.IsoDirections))
   21. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BrokenFences
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.BrokenFences

---

public class BrokenFences
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `BrokenFences.Tile`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final gnu.trove.map.hash.THashMap<String, BrokenFences.Tile>`

  `allMap`

  `private final gnu.trove.map.hash.THashMap<String, BrokenFences.Tile>`

  `brokenLeftMap`

  `private final gnu.trove.map.hash.THashMap<String, BrokenFences.Tile>`

  `brokenRightMap`

  `private static final BrokenFences`

  `instance`

  `private final gnu.trove.map.hash.THashMap<String, BrokenFences.Tile>`

  `unbrokenMap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BrokenFences()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addBrokenTiles(se.krka.kahlua.j2se.KahluaTableImpl tiles)`

  `private void`

  `addDebrisObject(IsoObject obj,
  IsoDirections dir)`

  `void`

  `addDebrisTiles(se.krka.kahlua.j2se.KahluaTableImpl tiles)`

  `void`

  `addItems(IsoObject obj,
  IsoGridSquare square)`

  `private void`

  `damageAdjacent(IsoGridSquare square,
  IsoDirections dirAdjacent,
  IsoDirections dirBreak)`

  `void`

  `destroyFence(IsoObject obj,
  IsoDirections dir)`

  `IsoObject`

  `getBreakableObject(IsoGridSquare square,
  boolean north)`

  `static BrokenFences`

  `getInstance()`

  `boolean`

  `isBreakableObject(IsoObject obj)`

  `boolean`

  `isBreakableSprite(String spriteName)`

  `private boolean`

  `isBrokenLeft(IsoObject obj)`

  `private boolean`

  `isBrokenRight(IsoObject obj)`

  `private boolean`

  `isNW(IsoObject obj)`

  `private boolean`

  `isUnbroken(IsoObject obj)`

  `void`

  `Reset()`

  `void`

  `setDamagedLeft(IsoObject obj)`

  `void`

  `setDamagedRight(IsoObject obj)`

  `void`

  `setDestroyed(IsoObject obj)`

  `private ArrayList<String>`

  `tableToTiles(se.krka.kahlua.j2se.KahluaTableImpl tiles)`

  `private ArrayList<String>`

  `tableToTiles(se.krka.kahlua.vm.KahluaTable table,
  String key)`

  `void`

  `updateSprite(IsoObject obj,
  boolean brokenLeft,
  boolean brokenRight)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static final [BrokenFences](BrokenFences.html "class in zombie.iso") instance
  + ### unbrokenMap

    private final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [BrokenFences.Tile](BrokenFences.Tile.html "class in zombie.iso")> unbrokenMap
  + ### brokenLeftMap

    private final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [BrokenFences.Tile](BrokenFences.Tile.html "class in zombie.iso")> brokenLeftMap
  + ### brokenRightMap

    private final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [BrokenFences.Tile](BrokenFences.Tile.html "class in zombie.iso")> brokenRightMap
  + ### allMap

    private final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [BrokenFences.Tile](BrokenFences.Tile.html "class in zombie.iso")> allMap
* Constructor Details
  -------------------

  + ### BrokenFences

    public BrokenFences()
* Method Details
  --------------

  + ### getInstance

    public static [BrokenFences](BrokenFences.html "class in zombie.iso") getInstance()
  + ### tableToTiles

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tableToTiles(se.krka.kahlua.j2se.KahluaTableImpl tiles)
  + ### tableToTiles

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tableToTiles(se.krka.kahlua.vm.KahluaTable table,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### addBrokenTiles

    public void addBrokenTiles(se.krka.kahlua.j2se.KahluaTableImpl tiles)
  + ### addDebrisTiles

    public void addDebrisTiles(se.krka.kahlua.j2se.KahluaTableImpl tiles)
  + ### setDestroyed

    public void setDestroyed([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### setDamagedLeft

    public void setDamagedLeft([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### setDamagedRight

    public void setDamagedRight([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### updateSprite

    public void updateSprite([IsoObject](IsoObject.html "class in zombie.iso") obj,
    boolean brokenLeft,
    boolean brokenRight)
  + ### isNW

    private boolean isNW([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### damageAdjacent

    private void damageAdjacent([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dirAdjacent,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dirBreak)
  + ### destroyFence

    public void destroyFence([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### isUnbroken

    private boolean isUnbroken([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### isBrokenLeft

    private boolean isBrokenLeft([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### isBrokenRight

    private boolean isBrokenRight([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### isBreakableObject

    public boolean isBreakableObject([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### isBreakableSprite

    public boolean isBreakableSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### getBreakableObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getBreakableObject([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    boolean north)
  + ### addItems

    public void addItems([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### addDebrisObject

    private void addDebrisObject([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### Reset

    public void Reset()