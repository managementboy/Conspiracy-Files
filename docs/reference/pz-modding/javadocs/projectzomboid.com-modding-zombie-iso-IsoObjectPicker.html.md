[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoObjectPicker](IsoObjectPicker.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [Instance](#Instance)
   2. [choices](#choices)
   3. [tempo](#tempo)
   4. [tempo2](#tempo2)
   5. [comp](#comp)
   6. [clickObjectStore](#clickObjectStore)
   7. [count](#count)
   8. [counter](#counter)
   9. [maxcount](#maxcount)
   10. [thisFrame](#thisFrame)
   11. [dirty](#dirty)
   12. [xOffSinceDirty](#xOffSinceDirty)
   13. [yOffSinceDirty](#yOffSinceDirty)
   14. [wasDirty](#wasDirty)
   15. [lastPickObject](#lastPickObject)
   16. [lx](#lx)
   17. [ly](#ly)
7. [Constructor Details](#constructor-detail)
   1. [IsoObjectPicker()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [Add(int, int, int, int, IsoGridSquare, IsoObject, boolean, float, float)](#Add(int,int,int,int,zombie.iso.IsoGridSquare,zombie.iso.IsoObject,boolean,float,float))
   3. [Init()](#Init())
   4. [ContextPick(int, int)](#ContextPick(int,int))
   5. [Pick(int, int)](#Pick(int,int))
   6. [StartRender()](#StartRender())
   7. [PickTarget(int, int)](#PickTarget(int,int))
   8. [PickDoor(int, int, boolean)](#PickDoor(int,int,boolean))
   9. [PickWindow(int, int)](#PickWindow(int,int))
   10. [PickWindowFrame(int, int)](#PickWindowFrame(int,int))
   11. [PickThumpable(int, int)](#PickThumpable(int,int))
   12. [PickHoppable(int, int)](#PickHoppable(int,int))
   13. [PickCorpse(int, int)](#PickCorpse(int,int))
   14. [PickTree(int, int)](#PickTree(int,int))
   15. [PickVehicle(int, int)](#PickVehicle(int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoObjectPicker
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoObjectPicker

---

public final class IsoObjectPicker
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `IsoObjectPicker.ClickObject`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) static final ArrayList<IsoObjectPicker.ClickObject>`

  `choices`

  `IsoObjectPicker.ClickObject[]`

  `clickObjectStore`

  `static final Comparator<IsoObjectPicker.ClickObject>`

  `comp`

  `int`

  `count`

  `int`

  `counter`

  `boolean`

  `dirty`

  `static final IsoObjectPicker`

  `Instance`

  `(package private) IsoObjectPicker.ClickObject`

  `lastPickObject`

  `(package private) float`

  `lx`

  `(package private) float`

  `ly`

  `int`

  `maxcount`

  `(package private) static final Vector2`

  `tempo`

  `(package private) static final Vector2`

  `tempo2`

  `final ArrayList<IsoObjectPicker.ClickObject>`

  `thisFrame`

  `boolean`

  `wasDirty`

  `float`

  `xOffSinceDirty`

  `float`

  `yOffSinceDirty`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoObjectPicker()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `Add(int x,
  int y,
  int width,
  int height,
  IsoGridSquare gridSquare,
  IsoObject tile,
  boolean flip,
  float scaleX,
  float scaleY)`

  `IsoObjectPicker.ClickObject`

  `ContextPick(int screenX,
  int screenY)`

  `IsoObjectPicker`

  `getInstance()`

  `void`

  `Init()`

  `IsoObjectPicker.ClickObject`

  `Pick(int xx,
  int yy)`

  `IsoObject`

  `PickCorpse(int screenX,
  int screenY)`

  `IsoObject`

  `PickDoor(int screenX,
  int screenY,
  boolean bTransparent)`

  `IsoObject`

  `PickHoppable(int screenX,
  int screenY)`

  `IsoMovingObject`

  `PickTarget(int xx,
  int yy)`

  `IsoObject`

  `PickThumpable(int screenX,
  int screenY)`

  `IsoObject`

  `PickTree(int screenX,
  int screenY)`

  `BaseVehicle`

  `PickVehicle(int screenX,
  int screenY)`

  `IsoObject`

  `PickWindow(int screenX,
  int screenY)`

  `IsoObject`

  `PickWindowFrame(int screenX,
  int screenY)`

  `void`

  `StartRender()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### Instance

    public static final [IsoObjectPicker](IsoObjectPicker.html "class in zombie.iso") Instance
  + ### choices

    static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObjectPicker.ClickObject](IsoObjectPicker.ClickObject.html "class in zombie.iso")> choices
  + ### tempo

    static final [Vector2](Vector2.html "class in zombie.iso") tempo
  + ### tempo2

    static final [Vector2](Vector2.html "class in zombie.iso") tempo2
  + ### comp

    public static final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoObjectPicker.ClickObject](IsoObjectPicker.ClickObject.html "class in zombie.iso")> comp
  + ### clickObjectStore

    public [IsoObjectPicker.ClickObject](IsoObjectPicker.ClickObject.html "class in zombie.iso")[] clickObjectStore
  + ### count

    public int count
  + ### counter

    public int counter
  + ### maxcount

    public int maxcount
  + ### thisFrame

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObjectPicker.ClickObject](IsoObjectPicker.ClickObject.html "class in zombie.iso")> thisFrame
  + ### dirty

    public boolean dirty
  + ### xOffSinceDirty

    public float xOffSinceDirty
  + ### yOffSinceDirty

    public float yOffSinceDirty
  + ### wasDirty

    public boolean wasDirty
  + ### lastPickObject

    [IsoObjectPicker.ClickObject](IsoObjectPicker.ClickObject.html "class in zombie.iso") lastPickObject
  + ### lx

    float lx
  + ### ly

    float ly
* Constructor Details
  -------------------

  + ### IsoObjectPicker

    public IsoObjectPicker()
* Method Details
  --------------

  + ### getInstance

    public [IsoObjectPicker](IsoObjectPicker.html "class in zombie.iso") getInstance()
  + ### Add

    public void Add(int x,
    int y,
    int width,
    int height,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gridSquare,
    [IsoObject](IsoObject.html "class in zombie.iso") tile,
    boolean flip,
    float scaleX,
    float scaleY)
  + ### Init

    public void Init()
  + ### ContextPick

    public [IsoObjectPicker.ClickObject](IsoObjectPicker.ClickObject.html "class in zombie.iso") ContextPick(int screenX,
    int screenY)
  + ### Pick

    public [IsoObjectPicker.ClickObject](IsoObjectPicker.ClickObject.html "class in zombie.iso") Pick(int xx,
    int yy)
  + ### StartRender

    public void StartRender()
  + ### PickTarget

    public [IsoMovingObject](IsoMovingObject.html "class in zombie.iso") PickTarget(int xx,
    int yy)
  + ### PickDoor

    public [IsoObject](IsoObject.html "class in zombie.iso") PickDoor(int screenX,
    int screenY,
    boolean bTransparent)
  + ### PickWindow

    public [IsoObject](IsoObject.html "class in zombie.iso") PickWindow(int screenX,
    int screenY)
  + ### PickWindowFrame

    public [IsoObject](IsoObject.html "class in zombie.iso") PickWindowFrame(int screenX,
    int screenY)
  + ### PickThumpable

    public [IsoObject](IsoObject.html "class in zombie.iso") PickThumpable(int screenX,
    int screenY)
  + ### PickHoppable

    public [IsoObject](IsoObject.html "class in zombie.iso") PickHoppable(int screenX,
    int screenY)
  + ### PickCorpse

    public [IsoObject](IsoObject.html "class in zombie.iso") PickCorpse(int screenX,
    int screenY)
  + ### PickTree

    public [IsoObject](IsoObject.html "class in zombie.iso") PickTree(int screenX,
    int screenY)
  + ### PickVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") PickVehicle(int screenX,
    int screenY)