[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoMetaCell](IsoMetaCell.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [vehicleZones](#vehicleZones)
   2. [chunkMap](#chunkMap)
   3. [info](#info)
   4. [triggers](#triggers)
   5. [wx](#wx)
   6. [wy](#wy)
   7. [animalZones](#animalZones)
   8. [animalZonesGenerated](#animalZonesGenerated)
   9. [mannequinZones](#mannequinZones)
   10. [worldGenZones](#worldGenZones)
   11. [roomTones](#roomTones)
   12. [rooms](#rooms)
   13. [roomByMetaId](#roomByMetaId)
   14. [roomList](#roomList)
   15. [buildings](#buildings)
   16. [buildingByMetaId](#buildingByMetaId)
   17. [isoRooms](#isoRooms)
   18. [isoBuildings](#isoBuildings)
6. [Constructor Details](#constructor-detail)
   1. [IsoMetaCell(int, int)](#%3Cinit%3E(int,int))
7. [Method Details](#method-detail)
   1. [getX()](#getX())
   2. [getY()](#getY())
   3. [addTrigger(BuildingDef, int, int, String)](#addTrigger(zombie.iso.BuildingDef,int,int,java.lang.String))
   4. [checkTriggers()](#checkTriggers())
   5. [getChunk(int, int)](#getChunk(int,int))
   6. [getChunk(int)](#getChunk(int))
   7. [hasChunk(int, int)](#hasChunk(int,int))
   8. [hasChunk(int)](#hasChunk(int))
   9. [clearChunk(int)](#clearChunk(int))
   10. [addZone(Zone, int, int)](#addZone(zombie.iso.zones.Zone,int,int))
   11. [removeZone(Zone)](#removeZone(zombie.iso.zones.Zone))
   12. [addRoom(RoomDef, int, int)](#addRoom(zombie.iso.RoomDef,int,int))
   13. [addRooms(ArrayList, int, int)](#addRooms(java.util.ArrayList,int,int))
   14. [removeRoom(RoomDef)](#removeRoom(zombie.iso.RoomDef))
   15. [removeRooms(ArrayList)](#removeRooms(java.util.ArrayList))
   16. [removeRooms(ArrayList, int)](#removeRooms(java.util.ArrayList,int))
   17. [getZonesUnique(Set)](#getZonesUnique(java.util.Set))
   18. [getZonesIntersecting(int, int, int, int, int, ArrayList)](#getZonesIntersecting(int,int,int,int,int,java.util.ArrayList))
   19. [getBuildingsIntersecting(int, int, int, int, ArrayList)](#getBuildingsIntersecting(int,int,int,int,java.util.ArrayList))
   20. [getRoomsIntersecting(int, int, int, int, ArrayList)](#getRoomsIntersecting(int,int,int,int,java.util.ArrayList))
   21. [checkAnimalZonesGenerated(int, int)](#checkAnimalZonesGenerated(int,int))
   22. [Dispose()](#Dispose())
   23. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   24. [load(IsoMetaGrid, ByteBuffer, int)](#load(zombie.iso.IsoMetaGrid,java.nio.ByteBuffer,int))
   25. [getAnimalZonesSize()](#getAnimalZonesSize())
   26. [getAnimalZone(int)](#getAnimalZone(int))
   27. [addAnimalZone(AnimalZone)](#addAnimalZone(zombie.characters.animals.AnimalZone))
   28. [clearAnimalZones()](#clearAnimalZones())
   29. [getBuildingCount()](#getBuildingCount())
   30. [getBuildingCount(boolean)](#getBuildingCount(boolean))
   31. [getRoomCount()](#getRoomCount())
   32. [getRoomCount(boolean)](#getRoomCount(boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoMetaCell
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoMetaCell

---

public final class IsoMetaCell
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<AnimalZone>`

  `animalZones`

  `private boolean`

  `animalZonesGenerated`

  `final gnu.trove.map.hash.TLongObjectHashMap<BuildingDef>`

  `buildingByMetaId`

  `final ArrayList<BuildingDef>`

  `buildings`

  `private final IsoMetaChunk[]`

  `chunkMap`

  `zombie.iso.LotHeader`

  `info`

  `final HashMap<Long, IsoBuilding>`

  `isoBuildings`

  `final HashMap<Long,IsoRoom>`

  `isoRooms`

  `final ArrayList<IsoMannequin.MannequinZone>`

  `mannequinZones`

  `final gnu.trove.map.hash.TLongObjectHashMap<RoomDef>`

  `roomByMetaId`

  `final ArrayList<RoomDef>`

  `roomList`

  `final HashMap<Long,RoomDef>`

  `rooms`

  `final ArrayList<zombie.iso.zones.RoomTone>`

  `roomTones`

  `final ArrayList<Trigger>`

  `triggers`

  `final ArrayList<VehicleZone>`

  `vehicleZones`

  `ArrayList<WorldGenZone>`

  `worldGenZones`

  `private final int`

  `wx`

  `private final int`

  `wy`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoMetaCell(int wx,
  int wy)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAnimalZone(AnimalZone animalZone)`

  `void`

  `addRoom(RoomDef room,
  int cellX,
  int cellY)`

  `void`

  `addRooms(ArrayList<RoomDef> rooms,
  int cellX,
  int cellY)`

  `void`

  `addTrigger(BuildingDef def,
  int triggerRange,
  int zombieExclusionRange,
  String type)`

  `void`

  `addZone(Zone zone,
  int cellX,
  int cellY)`

  `void`

  `checkAnimalZonesGenerated(int chunkX,
  int chunkY)`

  `void`

  `checkTriggers()`

  `void`

  `clearAnimalZones()`

  `void`

  `clearChunk(int i)`

  `void`

  `Dispose()`

  `AnimalZone`

  `getAnimalZone(int index)`

  `int`

  `getAnimalZonesSize()`

  `int`

  `getBuildingCount()`

  `int`

  `getBuildingCount(boolean bExcludeUserDefined)`

  `void`

  `getBuildingsIntersecting(int x,
  int y,
  int w,
  int h,
  ArrayList<BuildingDef> result)`

  `IsoMetaChunk`

  `getChunk(int i)`

  `IsoMetaChunk`

  `getChunk(int x,
  int y)`

  `int`

  `getRoomCount()`

  `int`

  `getRoomCount(boolean bExcludeUserDefined)`

  `void`

  `getRoomsIntersecting(int x,
  int y,
  int w,
  int h,
  ArrayList<RoomDef> result)`

  `int`

  `getX()`

  `int`

  `getY()`

  `void`

  `getZonesIntersecting(int x,
  int y,
  int z,
  int w,
  int h,
  ArrayList<Zone> result)`

  `void`

  `getZonesUnique(Set<Zone> result)`

  `boolean`

  `hasChunk(int i)`

  `boolean`

  `hasChunk(int x,
  int y)`

  `void`

  `load(IsoMetaGrid grid,
  ByteBuffer input,
  int worldVersion)`

  `void`

  `removeRoom(RoomDef room)`

  `void`

  `removeRooms(ArrayList<RoomDef> rooms)`

  `void`

  `removeRooms(ArrayList<RoomDef> rooms,
  int userDefined)`

  `void`

  `removeZone(Zone zone)`

  `void`

  `save(ByteBuffer output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### vehicleZones

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleZone](zones/VehicleZone.html "class in zombie.iso.zones")> vehicleZones
  + ### chunkMap

    private final [IsoMetaChunk](IsoMetaChunk.html "class in zombie.iso")[] chunkMap
  + ### info

    public zombie.iso.LotHeader info
  + ### triggers

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Trigger](zones/Trigger.html "class in zombie.iso.zones")> triggers
  + ### wx

    private final int wx
  + ### wy

    private final int wy
  + ### animalZones

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalZone](../characters/animals/AnimalZone.html "class in zombie.characters.animals")> animalZones
  + ### animalZonesGenerated

    private boolean animalZonesGenerated
  + ### mannequinZones

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoMannequin.MannequinZone](objects/IsoMannequin.MannequinZone.html "class in zombie.iso.objects")> mannequinZones
  + ### worldGenZones

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WorldGenZone](worldgen/zones/WorldGenZone.html "class in zombie.iso.worldgen.zones")> worldGenZones
  + ### roomTones

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.zones.RoomTone> roomTones
  + ### rooms

    public final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang"),[RoomDef](RoomDef.html "class in zombie.iso")> rooms
  + ### roomByMetaId

    public final gnu.trove.map.hash.TLongObjectHashMap<[RoomDef](RoomDef.html "class in zombie.iso")> roomByMetaId
  + ### roomList

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> roomList
  + ### buildings

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BuildingDef](BuildingDef.html "class in zombie.iso")> buildings
  + ### buildingByMetaId

    public final gnu.trove.map.hash.TLongObjectHashMap<[BuildingDef](BuildingDef.html "class in zombie.iso")> buildingByMetaId
  + ### isoRooms

    public final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang"),[IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas")> isoRooms
  + ### isoBuildings

    public final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang"), [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas")> isoBuildings
* Constructor Details
  -------------------

  + ### IsoMetaCell

    public IsoMetaCell(int wx,
    int wy)
* Method Details
  --------------

  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### addTrigger

    public void addTrigger([BuildingDef](BuildingDef.html "class in zombie.iso") def,
    int triggerRange,
    int zombieExclusionRange,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### checkTriggers

    public void checkTriggers()
  + ### getChunk

    public [IsoMetaChunk](IsoMetaChunk.html "class in zombie.iso") getChunk(int x,
    int y)
  + ### getChunk

    public [IsoMetaChunk](IsoMetaChunk.html "class in zombie.iso") getChunk(int i)
  + ### hasChunk

    public boolean hasChunk(int x,
    int y)
  + ### hasChunk

    public boolean hasChunk(int i)
  + ### clearChunk

    public void clearChunk(int i)
  + ### addZone

    public void addZone([Zone](zones/Zone.html "class in zombie.iso.zones") zone,
    int cellX,
    int cellY)
  + ### removeZone

    public void removeZone([Zone](zones/Zone.html "class in zombie.iso.zones") zone)
  + ### addRoom

    public void addRoom([RoomDef](RoomDef.html "class in zombie.iso") room,
    int cellX,
    int cellY)
  + ### addRooms

    public void addRooms([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> rooms,
    int cellX,
    int cellY)
  + ### removeRoom

    public void removeRoom([RoomDef](RoomDef.html "class in zombie.iso") room)
  + ### removeRooms

    public void removeRooms([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> rooms)
  + ### removeRooms

    public void removeRooms([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> rooms,
    int userDefined)
  + ### getZonesUnique

    public void getZonesUnique([Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> result)
  + ### getZonesIntersecting

    public void getZonesIntersecting(int x,
    int y,
    int z,
    int w,
    int h,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> result)
  + ### getBuildingsIntersecting

    public void getBuildingsIntersecting(int x,
    int y,
    int w,
    int h,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BuildingDef](BuildingDef.html "class in zombie.iso")> result)
  + ### getRoomsIntersecting

    public void getRoomsIntersecting(int x,
    int y,
    int w,
    int h,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> result)
  + ### checkAnimalZonesGenerated

    public void checkAnimalZonesGenerated(int chunkX,
    int chunkY)
  + ### Dispose

    public void Dispose()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### load

    public void load([IsoMetaGrid](IsoMetaGrid.html "class in zombie.iso") grid,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### getAnimalZonesSize

    public int getAnimalZonesSize()
  + ### getAnimalZone

    public [AnimalZone](../characters/animals/AnimalZone.html "class in zombie.characters.animals") getAnimalZone(int index)
  + ### addAnimalZone

    public void addAnimalZone([AnimalZone](../characters/animals/AnimalZone.html "class in zombie.characters.animals") animalZone)
  + ### clearAnimalZones

    public void clearAnimalZones()
  + ### getBuildingCount

    public int getBuildingCount()
  + ### getBuildingCount

    public int getBuildingCount(boolean bExcludeUserDefined)
  + ### getRoomCount

    public int getRoomCount()
  + ### getRoomCount

    public int getRoomCount(boolean bExcludeUserDefined)