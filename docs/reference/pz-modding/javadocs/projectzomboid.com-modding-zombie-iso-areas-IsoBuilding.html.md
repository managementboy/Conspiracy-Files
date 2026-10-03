[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.areas](package-summary.html)
2. [IsoBuilding](IsoBuilding.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [bounds](#bounds)
   2. [exits](#exits)
   3. [isResidence](#isResidence)
   4. [container](#container)
   5. [rooms](#rooms)
   6. [windows](#windows)
   7. [id](#id)
   8. [idCount](#idCount)
   9. [safety](#safety)
   10. [transparentWalls](#transparentWalls)
   11. [isToxic](#isToxic)
   12. [poorBuildingScore](#poorBuildingScore)
   13. [goodBuildingScore](#goodBuildingScore)
   14. [scoreUpdate](#scoreUpdate)
   15. [def](#def)
   16. [seenInside](#seenInside)
   17. [lights](#lights)
   18. [tempo](#tempo)
   19. [tempContainer](#tempContainer)
   20. [randomContainerChoices](#randomContainerChoices)
   21. [windowchoices](#windowchoices)
6. [Constructor Details](#constructor-detail)
   1. [IsoBuilding()](#%3Cinit%3E())
   2. [IsoBuilding(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
7. [Method Details](#method-detail)
   1. [getRoomsNumber()](#getRoomsNumber())
   2. [getID()](#getID())
   3. [TriggerAlarm()](#TriggerAlarm())
   4. [ContainsAllItems(Stack)](#ContainsAllItems(java.util.Stack))
   5. [ScoreBuildingPersonSpecific(SurvivorDesc, boolean)](#ScoreBuildingPersonSpecific(zombie.characters.SurvivorDesc,boolean))
   6. [getDef()](#getDef())
   7. [update()](#update())
   8. [AddRoom(IsoRoom)](#AddRoom(zombie.iso.areas.IsoRoom))
   9. [CalculateExits()](#CalculateExits())
   10. [CalculateWindows()](#CalculateWindows())
   11. [FillContainers()](#FillContainers())
   12. [getContainerWith(ItemType)](#getContainerWith(zombie.scripting.objects.ItemType))
   13. [getRandomRoom()](#getRandomRoom())
   14. [ScoreBuildingGeneral(BuildingScore)](#ScoreBuildingGeneral(zombie.iso.areas.BuildingScore))
   15. [getFreeTile()](#getFreeTile())
   16. [hasWater()](#hasWater())
   17. [CreateFrom(BuildingDef, IsoMetaCell)](#CreateFrom(zombie.iso.BuildingDef,zombie.iso.IsoMetaCell))
   18. [setAllExplored(boolean)](#setAllExplored(boolean))
   19. [setAllExplored(boolean, IsoRoom)](#setAllExplored(boolean,zombie.iso.areas.IsoRoom))
   20. [isAllExplored()](#isAllExplored())
   21. [addWindow(IsoWindow, boolean, IsoGridSquare, IsoBuilding)](#addWindow(zombie.iso.objects.IsoWindow,boolean,zombie.iso.IsoGridSquare,zombie.iso.areas.IsoBuilding))
   22. [addWindow(IsoWindow, boolean)](#addWindow(zombie.iso.objects.IsoWindow,boolean))
   23. [addDoor(IsoDoor, boolean, IsoGridSquare, IsoBuilding)](#addDoor(zombie.iso.objects.IsoDoor,boolean,zombie.iso.IsoGridSquare,zombie.iso.areas.IsoBuilding))
   24. [addDoor(IsoDoor, boolean)](#addDoor(zombie.iso.objects.IsoDoor,boolean))
   25. [isResidential()](#isResidential())
   26. [containsRoom(String)](#containsRoom(java.lang.String))
   27. [getRandomRoom(String)](#getRandomRoom(java.lang.String))
   28. [getRandomRoomExcluding(List)](#getRandomRoomExcluding(java.util.List))
   29. [hasRoom(String)](#hasRoom(java.lang.String))
   30. [getRandomContainer(String)](#getRandomContainer(java.lang.String))
   31. [getRandomContainerSingle(String)](#getRandomContainerSingle(java.lang.String))
   32. [getRandomFirstFloorWindow()](#getRandomFirstFloorWindow())
   33. [isToxic()](#isToxic())
   34. [setToxic(boolean)](#setToxic(boolean))
   35. [forceAwake()](#forceAwake())
   36. [hasBasement()](#hasBasement())
   37. [isEntirelyEmptyOutside()](#isEntirelyEmptyOutside())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoBuilding
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.IsoBuilding

---

public final class IsoBuilding
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `Rectangle`

  `bounds`

  `final ArrayList<ItemContainer>`

  `container`

  `BuildingDef`

  `def`

  `final Vector<zombie.iso.areas.IsoRoomExit>`

  `exits`

  `static float`

  `goodBuildingScore`

  `int`

  `id`

  `static int`

  `idCount`

  `boolean`

  `isResidence`

  `private boolean`

  `isToxic`

  `ArrayList<IsoLightSource>`

  `lights`

  `static float`

  `poorBuildingScore`

  `(package private) static ArrayList<String>`

  `randomContainerChoices`

  `final Vector<IsoRoom>`

  `rooms`

  `int`

  `safety`

  `int`

  `scoreUpdate`

  `boolean`

  `seenInside`

  `(package private) static ArrayList<ItemContainer>`

  `tempContainer`

  `(package private) static ArrayList<IsoRoom>`

  `tempo`

  `int`

  `transparentWalls`

  `(package private) static ArrayList<IsoWindow>`

  `windowchoices`

  `final Vector<IsoWindow>`

  `windows`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoBuilding()`

  `IsoBuilding(IsoCell cell)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addDoor(IsoDoor obj,
  boolean bOtherTile)`

  `void`

  `addDoor(IsoDoor obj,
  boolean bOtherTile,
  IsoGridSquare from,
  IsoBuilding building)`

  `void`

  `AddRoom(IsoRoom room)`

  `void`

  `addWindow(IsoWindow obj,
  boolean bOtherTile)`

  `void`

  `addWindow(IsoWindow obj,
  boolean bOtherTile,
  IsoGridSquare from,
  IsoBuilding building)`

  `void`

  `CalculateExits()`

  `void`

  `CalculateWindows()`

  `boolean`

  `ContainsAllItems(Stack<String> items)`

  `boolean`

  `containsRoom(String room)`

  `void`

  `CreateFrom(BuildingDef building,
  IsoMetaCell metaCell)`

  `void`

  `FillContainers()`

  `void`

  `forceAwake()`

  `ItemContainer`

  `getContainerWith(ItemType itemType)`

  `BuildingDef`

  `getDef()`

  `IsoGridSquare`

  `getFreeTile()`

  `int`

  `getID()`

  `ItemContainer`

  `getRandomContainer(String type)`

  `ItemContainer`

  `getRandomContainerSingle(String type)`

  `IsoWindow`

  `getRandomFirstFloorWindow()`

  `IsoRoom`

  `getRandomRoom()`

  `IsoRoom`

  `getRandomRoom(String room)`

  `IsoRoom`

  `getRandomRoomExcluding(List<String> badRooms)`

  `int`

  `getRoomsNumber()`

  `boolean`

  `hasBasement()`

  `boolean`

  `hasRoom(String room)`

  `boolean`

  `hasWater()`

  `boolean`

  `isAllExplored()`

  `boolean`

  `isEntirelyEmptyOutside()`

  `boolean`

  `isResidential()`

  `boolean`

  `isToxic()`

  `private zombie.iso.areas.BuildingScore`

  `ScoreBuildingGeneral(zombie.iso.areas.BuildingScore score)`

  `float`

  `ScoreBuildingPersonSpecific(SurvivorDesc desc,
  boolean bFarGood)`

  `void`

  `setAllExplored(boolean b)`

  `void`

  `setAllExplored(boolean b,
  IsoRoom exception)`

  `void`

  `setToxic(boolean isToxic)`

  `void`

  `TriggerAlarm()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### bounds

    public [Rectangle](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/Rectangle.html "class or interface in java.awt") bounds
  + ### exits

    public final [Vector](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Vector.html "class or interface in java.util")<zombie.iso.areas.IsoRoomExit> exits
  + ### isResidence

    public boolean isResidence
  + ### container

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory")> container
  + ### rooms

    public final [Vector](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Vector.html "class or interface in java.util")<[IsoRoom](IsoRoom.html "class in zombie.iso.areas")> rooms
  + ### windows

    public final [Vector](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Vector.html "class or interface in java.util")<[IsoWindow](../objects/IsoWindow.html "class in zombie.iso.objects")> windows
  + ### id

    public int id
  + ### idCount

    public static int idCount
  + ### safety

    public int safety
  + ### transparentWalls

    public int transparentWalls
  + ### isToxic

    private boolean isToxic
  + ### poorBuildingScore

    public static float poorBuildingScore
  + ### goodBuildingScore

    public static float goodBuildingScore
  + ### scoreUpdate

    public int scoreUpdate
  + ### def

    public [BuildingDef](../BuildingDef.html "class in zombie.iso") def
  + ### seenInside

    public boolean seenInside
  + ### lights

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoLightSource](../IsoLightSource.html "class in zombie.iso")> lights
  + ### tempo

    static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoRoom](IsoRoom.html "class in zombie.iso.areas")> tempo
  + ### tempContainer

    static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory")> tempContainer
  + ### randomContainerChoices

    static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> randomContainerChoices
  + ### windowchoices

    static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWindow](../objects/IsoWindow.html "class in zombie.iso.objects")> windowchoices
* Constructor Details
  -------------------

  + ### IsoBuilding

    public IsoBuilding()
  + ### IsoBuilding

    public IsoBuilding([IsoCell](../IsoCell.html "class in zombie.iso") cell)
* Method Details
  --------------

  + ### getRoomsNumber

    public int getRoomsNumber()
  + ### getID

    public int getID()
  + ### TriggerAlarm

    public void TriggerAlarm()
  + ### ContainsAllItems

    public boolean ContainsAllItems([Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> items)
  + ### ScoreBuildingPersonSpecific

    public float ScoreBuildingPersonSpecific([SurvivorDesc](../../characters/SurvivorDesc.html "class in zombie.characters") desc,
    boolean bFarGood)
  + ### getDef

    public [BuildingDef](../BuildingDef.html "class in zombie.iso") getDef()
  + ### update

    public void update()
  + ### AddRoom

    public void AddRoom([IsoRoom](IsoRoom.html "class in zombie.iso.areas") room)
  + ### CalculateExits

    public void CalculateExits()
  + ### CalculateWindows

    public void CalculateWindows()
  + ### FillContainers

    public void FillContainers()
  + ### getContainerWith

    public [ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") getContainerWith([ItemType](../../scripting/objects/ItemType.html "class in zombie.scripting.objects") itemType)
  + ### getRandomRoom

    public [IsoRoom](IsoRoom.html "class in zombie.iso.areas") getRandomRoom()
  + ### ScoreBuildingGeneral

    private zombie.iso.areas.BuildingScore ScoreBuildingGeneral(zombie.iso.areas.BuildingScore score)
  + ### getFreeTile

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getFreeTile()
  + ### hasWater

    public boolean hasWater()
  + ### CreateFrom

    public void CreateFrom([BuildingDef](../BuildingDef.html "class in zombie.iso") building,
    [IsoMetaCell](../IsoMetaCell.html "class in zombie.iso") metaCell)
  + ### setAllExplored

    public void setAllExplored(boolean b)
  + ### setAllExplored

    public void setAllExplored(boolean b,
    [IsoRoom](IsoRoom.html "class in zombie.iso.areas") exception)
  + ### isAllExplored

    public boolean isAllExplored()
  + ### addWindow

    public void addWindow([IsoWindow](../objects/IsoWindow.html "class in zombie.iso.objects") obj,
    boolean bOtherTile,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") from,
    [IsoBuilding](IsoBuilding.html "class in zombie.iso.areas") building)
  + ### addWindow

    public void addWindow([IsoWindow](../objects/IsoWindow.html "class in zombie.iso.objects") obj,
    boolean bOtherTile)
  + ### addDoor

    public void addDoor([IsoDoor](../objects/IsoDoor.html "class in zombie.iso.objects") obj,
    boolean bOtherTile,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") from,
    [IsoBuilding](IsoBuilding.html "class in zombie.iso.areas") building)
  + ### addDoor

    public void addDoor([IsoDoor](../objects/IsoDoor.html "class in zombie.iso.objects") obj,
    boolean bOtherTile)
  + ### isResidential

    public boolean isResidential()
  + ### containsRoom

    public boolean containsRoom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") room)
  + ### getRandomRoom

    public [IsoRoom](IsoRoom.html "class in zombie.iso.areas") getRandomRoom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") room)
  + ### getRandomRoomExcluding

    public [IsoRoom](IsoRoom.html "class in zombie.iso.areas") getRandomRoomExcluding([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> badRooms)
  + ### hasRoom

    public boolean hasRoom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") room)
  + ### getRandomContainer

    public [ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") getRandomContainer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getRandomContainerSingle

    public [ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") getRandomContainerSingle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getRandomFirstFloorWindow

    public [IsoWindow](../objects/IsoWindow.html "class in zombie.iso.objects") getRandomFirstFloorWindow()
  + ### isToxic

    public boolean isToxic()
  + ### setToxic

    public void setToxic(boolean isToxic)
  + ### forceAwake

    public void forceAwake()
  + ### hasBasement

    public boolean hasBasement()
  + ### isEntirelyEmptyOutside

    public boolean isEntirelyEmptyOutside()