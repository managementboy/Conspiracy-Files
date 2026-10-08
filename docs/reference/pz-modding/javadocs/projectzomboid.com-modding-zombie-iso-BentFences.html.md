[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [BentFences](BentFences.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [entries](#entries)
   3. [collapsedTiles](#collapsedTiles)
   4. [debrisTiles](#debrisTiles)
   5. [fenceMap](#fenceMap)
7. [Constructor Details](#constructor-detail)
   1. [BentFences()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [tableToTiles(KahluaTableImpl, ArrayList)](#tableToTiles(se.krka.kahlua.j2se.KahluaTableImpl,java.util.ArrayList))
   3. [tableToTiles(KahluaTable, String)](#tableToTiles(se.krka.kahlua.vm.KahluaTable,java.lang.String))
   4. [addFenceTiles(int, KahluaTableImpl)](#addFenceTiles(int,se.krka.kahlua.j2se.KahluaTableImpl))
   5. [isBentObject(IsoObject)](#isBentObject(zombie.iso.IsoObject))
   6. [isUnbentObject(IsoObject)](#isUnbentObject(zombie.iso.IsoObject))
   7. [isUnbentObject(IsoObject, IsoDirections)](#isUnbentObject(zombie.iso.IsoObject,zombie.iso.IsoDirections))
   8. [getEntryForObject(IsoObject)](#getEntryForObject(zombie.iso.IsoObject))
   9. [getEntryForObject(IsoObject, IsoDirections)](#getEntryForObject(zombie.iso.IsoObject,zombie.iso.IsoDirections))
   10. [getBendStage(IsoObject, BentFences.Entry)](#getBendStage(zombie.iso.IsoObject,zombie.iso.BentFences.Entry))
   11. [getTileIndex(ArrayList, IsoObject, BentFences.Entry)](#getTileIndex(java.util.ArrayList,zombie.iso.IsoObject,zombie.iso.BentFences.Entry))
   12. [getTileIndex(ArrayList, IsoObject, BentFences.Entry, boolean)](#getTileIndex(java.util.ArrayList,zombie.iso.IsoObject,zombie.iso.BentFences.Entry,boolean))
   13. [isValidSpan(ArrayList, IsoObject, BentFences.Entry, int)](#isValidSpan(java.util.ArrayList,zombie.iso.IsoObject,zombie.iso.BentFences.Entry,int))
   14. [isValidObject(IsoObject, BentFences.Entry)](#isValidObject(zombie.iso.IsoObject,zombie.iso.BentFences.Entry))
   15. [getObjectForEntry(IsoGridSquare, ArrayList, int)](#getObjectForEntry(zombie.iso.IsoGridSquare,java.util.ArrayList,int))
   16. [checkCanCollapse(IsoObject, IsoDirections, BentFences.Entry)](#checkCanCollapse(zombie.iso.IsoObject,zombie.iso.IsoDirections,zombie.iso.BentFences.Entry))
   17. [isWallBlockingObjectOnTile(IsoDirections, BentFences.Entry, int, int, IsoObject)](#isWallBlockingObjectOnTile(zombie.iso.IsoDirections,zombie.iso.BentFences.Entry,int,int,zombie.iso.IsoObject))
   18. [emptyContainerIfPresent(IsoObject, IsoGridSquare)](#emptyContainerIfPresent(zombie.iso.IsoObject,zombie.iso.IsoGridSquare))
   19. [collapse(IsoObject, IsoDirections, BentFences.Entry, int)](#collapse(zombie.iso.IsoObject,zombie.iso.IsoDirections,zombie.iso.BentFences.Entry,int))
   20. [removeCollapsedTiles(IsoObject, IsoDirections, BentFences.Entry, int)](#removeCollapsedTiles(zombie.iso.IsoObject,zombie.iso.IsoDirections,zombie.iso.BentFences.Entry,int))
   21. [smashFence(IsoObject, IsoDirections)](#smashFence(zombie.iso.IsoObject,zombie.iso.IsoDirections))
   22. [smashFence(IsoObject, IsoDirections, int)](#smashFence(zombie.iso.IsoObject,zombie.iso.IsoDirections,int))
   23. [swapTiles(IsoObject, IsoDirections, boolean)](#swapTiles(zombie.iso.IsoObject,zombie.iso.IsoDirections,boolean))
   24. [swapTiles(IsoObject, IsoDirections, boolean, int)](#swapTiles(zombie.iso.IsoObject,zombie.iso.IsoDirections,boolean,int))
   25. [splitCorner(IsoObject, IsoGridSquare, BentFences.Entry)](#splitCorner(zombie.iso.IsoObject,zombie.iso.IsoGridSquare,zombie.iso.BentFences.Entry))
   26. [bendFence(IsoObject, IsoDirections)](#bendFence(zombie.iso.IsoObject,zombie.iso.IsoDirections))
   27. [unbendFence(IsoObject)](#unbendFence(zombie.iso.IsoObject))
   28. [resetFence(IsoObject)](#resetFence(zombie.iso.IsoObject))
   29. [isBendableFence(IsoObject)](#isBendableFence(zombie.iso.IsoObject))
   30. [getThumpData(IsoObject)](#getThumpData(zombie.iso.IsoObject))
   31. [getThumpData(IsoObject, BentFences.Entry)](#getThumpData(zombie.iso.IsoObject,zombie.iso.BentFences.Entry))
   32. [getCollapsedFence(IsoGridSquare)](#getCollapsedFence(zombie.iso.IsoGridSquare))
   33. [checkDamageHoppableFence(IsoMovingObject, IsoGridSquare, IsoGridSquare)](#checkDamageHoppableFence(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   34. [doSquareUpdateTasks(IsoGridSquare)](#doSquareUpdateTasks(zombie.iso.IsoGridSquare))
   35. [addDebrisObject(IsoObject, IsoDirections, BentFences.Entry)](#addDebrisObject(zombie.iso.IsoObject,zombie.iso.IsoDirections,zombie.iso.BentFences.Entry))
   36. [getThumpersRequired()](#getThumpersRequired())
   37. [getFenceDamageMultiplier()](#getFenceDamageMultiplier())
   38. [isEnabled()](#isEnabled())
   39. [init()](#init())
   40. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BentFences
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.BentFences

---

public class BentFences
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `BentFences.Entry`

  `static final class`

  `BentFences.ThumpData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashSet<String>`

  `collapsedTiles`

  `private final HashSet<String>`

  `debrisTiles`

  `private final ArrayList<BentFences.Entry>`

  `entries`

  `private final HashMap<String, ArrayList<BentFences.Entry>>`

  `fenceMap`

  `private static final BentFences`

  `instance`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BentFences()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addDebrisObject(IsoObject obj,
  IsoDirections dir,
  BentFences.Entry entry)`

  `void`

  `addFenceTiles(int version,
  se.krka.kahlua.j2se.KahluaTableImpl tiles)`

  `void`

  `bendFence(IsoObject obj,
  IsoDirections dir)`

  `boolean`

  `checkCanCollapse(IsoObject obj,
  IsoDirections dir,
  BentFences.Entry entry)`

  `void`

  `checkDamageHoppableFence(IsoMovingObject thumper,
  IsoGridSquare sq,
  IsoGridSquare oppositeSq)`

  `void`

  `collapse(IsoObject obj,
  IsoDirections dir,
  BentFences.Entry entry,
  int index)`

  `private static void`

  `doSquareUpdateTasks(IsoGridSquare square)`

  `private void`

  `emptyContainerIfPresent(IsoObject object,
  IsoGridSquare square)`

  `private int`

  `getBendStage(IsoObject obj,
  BentFences.Entry entry)`

  `IsoObject`

  `getCollapsedFence(IsoGridSquare square)`

  `private BentFences.Entry`

  `getEntryForObject(IsoObject obj)`

  `private BentFences.Entry`

  `getEntryForObject(IsoObject obj,
  IsoDirections dir)`

  `private static float`

  `getFenceDamageMultiplier()`

  `static BentFences`

  `getInstance()`

  `(package private) IsoObject`

  `getObjectForEntry(IsoGridSquare square,
  ArrayList<String> tiles,
  int index)`

  `BentFences.ThumpData`

  `getThumpData(IsoObject obj)`

  `BentFences.ThumpData`

  `getThumpData(IsoObject obj,
  BentFences.Entry entry)`

  `private static int`

  `getThumpersRequired()`

  `private int`

  `getTileIndex(ArrayList<String> tiles,
  IsoObject obj,
  BentFences.Entry entry)`

  `private int`

  `getTileIndex(ArrayList<String> tiles,
  IsoObject obj,
  BentFences.Entry entry,
  boolean forceFirst)`

  `static void`

  `init()`

  `boolean`

  `isBendableFence(IsoObject obj)`

  `boolean`

  `isBentObject(IsoObject obj)`

  `boolean`

  `isEnabled()`

  `boolean`

  `isUnbentObject(IsoObject obj)`

  `boolean`

  `isUnbentObject(IsoObject obj,
  IsoDirections dir)`

  `private boolean`

  `isValidObject(IsoObject obj,
  BentFences.Entry entry)`

  `private boolean`

  `isValidSpan(ArrayList<String> tiles,
  IsoObject obj,
  BentFences.Entry entry,
  int index)`

  `private static boolean`

  `isWallBlockingObjectOnTile(IsoDirections dir,
  BentFences.Entry entry,
  int x,
  int y,
  IsoObject object)`

  `void`

  `removeCollapsedTiles(IsoObject obj,
  IsoDirections dir,
  BentFences.Entry entry,
  int index)`

  `void`

  `Reset()`

  `void`

  `resetFence(IsoObject obj)`

  `void`

  `smashFence(IsoObject obj,
  IsoDirections dir)`

  `void`

  `smashFence(IsoObject obj,
  IsoDirections dir,
  int index)`

  `private static void`

  `splitCorner(IsoObject obj,
  IsoGridSquare square,
  BentFences.Entry entry)`

  `void`

  `swapTiles(IsoObject obj,
  IsoDirections dir,
  boolean bending)`

  `void`

  `swapTiles(IsoObject obj,
  IsoDirections dir,
  boolean bending,
  int forceStage)`

  `private ArrayList<String>`

  `tableToTiles(se.krka.kahlua.j2se.KahluaTableImpl tiles,
  ArrayList<String> result)`

  `private ArrayList<String>`

  `tableToTiles(se.krka.kahlua.vm.KahluaTable table,
  String key)`

  `void`

  `unbendFence(IsoObject obj)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static final [BentFences](BentFences.html "class in zombie.iso") instance
  + ### entries

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BentFences.Entry](BentFences.Entry.html "class in zombie.iso")> entries
  + ### collapsedTiles

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> collapsedTiles
  + ### debrisTiles

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> debrisTiles
  + ### fenceMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BentFences.Entry](BentFences.Entry.html "class in zombie.iso")>> fenceMap
* Constructor Details
  -------------------

  + ### BentFences

    public BentFences()
* Method Details
  --------------

  + ### getInstance

    public static [BentFences](BentFences.html "class in zombie.iso") getInstance()
  + ### tableToTiles

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tableToTiles(se.krka.kahlua.j2se.KahluaTableImpl tiles,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> result)
  + ### tableToTiles

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tableToTiles(se.krka.kahlua.vm.KahluaTable table,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### addFenceTiles

    public void addFenceTiles(int version,
    se.krka.kahlua.j2se.KahluaTableImpl tiles)
  + ### isBentObject

    public boolean isBentObject([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### isUnbentObject

    public boolean isUnbentObject([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### isUnbentObject

    public boolean isUnbentObject([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### getEntryForObject

    private [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") getEntryForObject([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### getEntryForObject

    private [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") getEntryForObject([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### getBendStage

    private int getBendStage([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry)
  + ### getTileIndex

    private int getTileIndex([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tiles,
    [IsoObject](IsoObject.html "class in zombie.iso") obj,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry)
  + ### getTileIndex

    private int getTileIndex([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tiles,
    [IsoObject](IsoObject.html "class in zombie.iso") obj,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry,
    boolean forceFirst)
  + ### isValidSpan

    private boolean isValidSpan([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tiles,
    [IsoObject](IsoObject.html "class in zombie.iso") obj,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry,
    int index)
  + ### isValidObject

    private boolean isValidObject([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry)
  + ### getObjectForEntry

    [IsoObject](IsoObject.html "class in zombie.iso") getObjectForEntry([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tiles,
    int index)
  + ### checkCanCollapse

    public boolean checkCanCollapse([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry)
  + ### isWallBlockingObjectOnTile

    private static boolean isWallBlockingObjectOnTile([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry,
    int x,
    int y,
    [IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### emptyContainerIfPresent

    private void emptyContainerIfPresent([IsoObject](IsoObject.html "class in zombie.iso") object,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### collapse

    public void collapse([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry,
    int index)
  + ### removeCollapsedTiles

    public void removeCollapsedTiles([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry,
    int index)
  + ### smashFence

    public void smashFence([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### smashFence

    public void smashFence([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    int index)
  + ### swapTiles

    public void swapTiles([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    boolean bending)
  + ### swapTiles

    public void swapTiles([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    boolean bending,
    int forceStage)
  + ### splitCorner

    private static void splitCorner([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry)
  + ### bendFence

    public void bendFence([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### unbendFence

    public void unbendFence([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### resetFence

    public void resetFence([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### isBendableFence

    public boolean isBendableFence([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### getThumpData

    public [BentFences.ThumpData](BentFences.ThumpData.html "class in zombie.iso") getThumpData([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### getThumpData

    public [BentFences.ThumpData](BentFences.ThumpData.html "class in zombie.iso") getThumpData([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry)
  + ### getCollapsedFence

    public [IsoObject](IsoObject.html "class in zombie.iso") getCollapsedFence([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### checkDamageHoppableFence

    public void checkDamageHoppableFence([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") thumper,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") oppositeSq)
  + ### doSquareUpdateTasks

    private static void doSquareUpdateTasks([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### addDebrisObject

    private void addDebrisObject([IsoObject](IsoObject.html "class in zombie.iso") obj,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    [BentFences.Entry](BentFences.Entry.html "class in zombie.iso") entry)
  + ### getThumpersRequired

    private static int getThumpersRequired()
  + ### getFenceDamageMultiplier

    private static float getFenceDamageMultiplier()
  + ### isEnabled

    public boolean isEnabled()
  + ### init

    public static void init()
  + ### Reset

    public void Reset()