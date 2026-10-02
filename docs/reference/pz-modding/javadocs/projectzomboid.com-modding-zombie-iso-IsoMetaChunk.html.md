[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoMetaChunk](IsoMetaChunk.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [zombiesMinPerChunk](#zombiesMinPerChunk)
   2. [zombiesFullPerChunk](#zombiesFullPerChunk)
   3. [zombieIntensity](#zombieIntensity)
   4. [zones](#zones)
   5. [zonesSize](#zonesSize)
   6. [rooms](#rooms)
   7. [roomsSize](#roomsSize)
6. [Constructor Details](#constructor-detail)
   1. [IsoMetaChunk()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getZonesSize()](#getZonesSize())
   2. [compactZoneArray()](#compactZoneArray())
   3. [compactRoomDefArray()](#compactRoomDefArray())
   4. [doesHaveForaging()](#doesHaveForaging())
   5. [doesHaveZone(String)](#doesHaveZone(java.lang.String))
   6. [getRoomsSize()](#getRoomsSize())
   7. [getZombieIntensity(boolean)](#getZombieIntensity(boolean))
   8. [getZombieIntensity()](#getZombieIntensity())
   9. [setZombieIntensity(byte)](#setZombieIntensity(byte))
   10. [getLootZombieIntensity()](#getLootZombieIntensity())
   11. [getUnadjustedZombieIntensity()](#getUnadjustedZombieIntensity())
   12. [addZone(Zone)](#addZone(zombie.iso.zones.Zone))
   13. [removeZone(Zone)](#removeZone(zombie.iso.zones.Zone))
   14. [getZone(int)](#getZone(int))
   15. [getZoneAt(int, int, int)](#getZoneAt(int,int,int))
   16. [getZonesAt(int, int, int, ArrayList)](#getZonesAt(int,int,int,java.util.ArrayList))
   17. [getZonesAt(int, int, int)](#getZonesAt(int,int,int))
   18. [getZoneAt(int, int, int, String)](#getZoneAt(int,int,int,java.lang.String))
   19. [getZonesUnique(Set)](#getZonesUnique(java.util.Set))
   20. [getZonesIntersecting(int, int, int, int, int, ArrayList)](#getZonesIntersecting(int,int,int,int,int,java.util.ArrayList))
   21. [clearZones()](#clearZones())
   22. [clearRooms()](#clearRooms())
   23. [addRoom(RoomDef)](#addRoom(zombie.iso.RoomDef))
   24. [removeRoom(RoomDef)](#removeRoom(zombie.iso.RoomDef))
   25. [getRoomAt(int, int, int)](#getRoomAt(int,int,int))
   26. [getEmptyOutsideAt(int, int, int)](#getEmptyOutsideAt(int,int,int))
   27. [getAssociatedBuildingAt(int, int)](#getAssociatedBuildingAt(int,int))
   28. [getBuildingsIntersecting(int, int, int, int, ArrayList)](#getBuildingsIntersecting(int,int,int,int,java.util.ArrayList))
   29. [getRoomsIntersecting(int, int, int, int, ArrayList)](#getRoomsIntersecting(int,int,int,int,java.util.ArrayList))
   30. [Dispose()](#Dispose())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoMetaChunk
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoMetaChunk

---

public final class IsoMetaChunk
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private RoomDef[]`

  `rooms`

  `private int`

  `roomsSize`

  `private byte`

  `zombieIntensity`

  `static final float`

  `zombiesFullPerChunk`

  `static final float`

  `zombiesMinPerChunk`

  `private Zone[]`

  `zones`

  `private int`

  `zonesSize`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoMetaChunk()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addRoom(RoomDef room)`

  `void`

  `addZone(Zone zone)`

  `void`

  `clearRooms()`

  `void`

  `clearZones()`

  `void`

  `compactRoomDefArray()`

  `void`

  `compactZoneArray()`

  `void`

  `Dispose()`

  `boolean`

  `doesHaveForaging()`

  `boolean`

  `doesHaveZone(String zone)`

  `BuildingDef`

  `getAssociatedBuildingAt(int x,
  int y)`

  `void`

  `getBuildingsIntersecting(int x,
  int y,
  int w,
  int h,
  ArrayList<BuildingDef> result)`

  `RoomDef`

  `getEmptyOutsideAt(int x,
  int y,
  int z)`

  `float`

  `getLootZombieIntensity()`

  `RoomDef`

  `getRoomAt(int x,
  int y,
  int z)`

  `void`

  `getRoomsIntersecting(int x,
  int y,
  int w,
  int h,
  ArrayList<RoomDef> result)`

  `int`

  `getRoomsSize()`

  `int`

  `getUnadjustedZombieIntensity()`

  `float`

  `getZombieIntensity()`

  `float`

  `getZombieIntensity(boolean bRandom)`

  `Zone`

  `getZone(int index)`

  `Zone`

  `getZoneAt(int x,
  int y,
  int z)`

  `Zone`

  `getZoneAt(int x,
  int y,
  int z,
  String zone)`

  `ArrayList<Zone>`

  `getZonesAt(int x,
  int y,
  int z)`

  `ArrayList<Zone>`

  `getZonesAt(int x,
  int y,
  int z,
  ArrayList<Zone> result)`

  `void`

  `getZonesIntersecting(int x,
  int y,
  int z,
  int w,
  int h,
  ArrayList<Zone> result)`

  `int`

  `getZonesSize()`

  `void`

  `getZonesUnique(Set<Zone> result)`

  `void`

  `removeRoom(RoomDef room)`

  `void`

  `removeZone(Zone zone)`

  `void`

  `setZombieIntensity(byte zombieIntensity)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### zombiesMinPerChunk

    public static final float zombiesMinPerChunk

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoMetaChunk.zombiesMinPerChunk)
  + ### zombiesFullPerChunk

    public static final float zombiesFullPerChunk

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoMetaChunk.zombiesFullPerChunk)
  + ### zombieIntensity

    private byte zombieIntensity
  + ### zones

    private [Zone](zones/Zone.html "class in zombie.iso.zones")[] zones
  + ### zonesSize

    private int zonesSize
  + ### rooms

    private [RoomDef](RoomDef.html "class in zombie.iso")[] rooms
  + ### roomsSize

    private int roomsSize
* Constructor Details
  -------------------

  + ### IsoMetaChunk

    public IsoMetaChunk()
* Method Details
  --------------

  + ### getZonesSize

    public int getZonesSize()
  + ### compactZoneArray

    public void compactZoneArray()
  + ### compactRoomDefArray

    public void compactRoomDefArray()
  + ### doesHaveForaging

    public boolean doesHaveForaging()
  + ### doesHaveZone

    public boolean doesHaveZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zone)
  + ### getRoomsSize

    public int getRoomsSize()
  + ### getZombieIntensity

    public float getZombieIntensity(boolean bRandom)
  + ### getZombieIntensity

    public float getZombieIntensity()
  + ### setZombieIntensity

    public void setZombieIntensity(byte zombieIntensity)
  + ### getLootZombieIntensity

    public float getLootZombieIntensity()
  + ### getUnadjustedZombieIntensity

    public int getUnadjustedZombieIntensity()
  + ### addZone

    public void addZone([Zone](zones/Zone.html "class in zombie.iso.zones") zone)
  + ### removeZone

    public void removeZone([Zone](zones/Zone.html "class in zombie.iso.zones") zone)
  + ### getZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") getZone(int index)
  + ### getZoneAt

    public [Zone](zones/Zone.html "class in zombie.iso.zones") getZoneAt(int x,
    int y,
    int z)
  + ### getZonesAt

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> getZonesAt(int x,
    int y,
    int z,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> result)
  + ### getZonesAt

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> getZonesAt(int x,
    int y,
    int z)
  + ### getZoneAt

    public [Zone](zones/Zone.html "class in zombie.iso.zones") getZoneAt(int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zone)
  + ### getZonesUnique

    public void getZonesUnique([Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> result)
  + ### getZonesIntersecting

    public void getZonesIntersecting(int x,
    int y,
    int z,
    int w,
    int h,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> result)
  + ### clearZones

    public void clearZones()
  + ### clearRooms

    public void clearRooms()
  + ### addRoom

    public void addRoom([RoomDef](RoomDef.html "class in zombie.iso") room)
  + ### removeRoom

    public void removeRoom([RoomDef](RoomDef.html "class in zombie.iso") room)
  + ### getRoomAt

    public [RoomDef](RoomDef.html "class in zombie.iso") getRoomAt(int x,
    int y,
    int z)
  + ### getEmptyOutsideAt

    public [RoomDef](RoomDef.html "class in zombie.iso") getEmptyOutsideAt(int x,
    int y,
    int z)
  + ### getAssociatedBuildingAt

    public [BuildingDef](BuildingDef.html "class in zombie.iso") getAssociatedBuildingAt(int x,
    int y)
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
  + ### Dispose

    public void Dispose()