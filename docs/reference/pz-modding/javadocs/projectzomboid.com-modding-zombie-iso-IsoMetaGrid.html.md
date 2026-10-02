[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoMetaGrid](IsoMetaGrid.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [NUM\_LOADER\_THREADS](#NUM_LOADER_THREADS)
   2. [ANY\_Z](#ANY_Z)
   3. [clipperOffset](#clipperOffset)
   4. [clipperBuffer](#clipperBuffer)
   5. [TL\_ZoneList](#TL_ZoneList)
   6. [TL\_Location](#TL_Location)
   7. [a](#a)
   8. [b](#b)
   9. [roomChoices](#roomChoices)
   10. [tempRooms](#tempRooms)
   11. [tempZones1](#tempZones1)
   12. [tempZones2](#tempZones2)
   13. [threads](#threads)
   14. [minX](#minX)
   15. [minY](#minY)
   16. [maxX](#maxX)
   17. [maxY](#maxY)
   18. [minNonProceduralX](#minNonProceduralX)
   19. [minNonProceduralY](#minNonProceduralY)
   20. [maxNonProceduralX](#maxNonProceduralX)
   21. [maxNonProceduralY](#maxNonProceduralY)
   22. [zones](#zones)
   23. [buildings](#buildings)
   24. [vehiclesZones](#vehiclesZones)
   25. [animalZoneHandler](#animalZoneHandler)
   26. [grid](#grid)
   27. [cellsToSave](#cellsToSave)
   28. [metaCharacters](#metaCharacters)
   29. [highZombieList](#highZombieList)
   30. [width](#width)
   31. [height](#height)
   32. [sharedStrings](#sharedStrings)
   33. [createStartTime](#createStartTime)
   34. [loaded](#loaded)
   35. [removedBuildings](#removedBuildings)
   36. [IDEAL\_MAX\_ZONE\_SIZE](#IDEAL_MAX_ZONE_SIZE)
7. [Constructor Details](#constructor-detail)
   1. [IsoMetaGrid()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getCell(int, int)](#getCell(int,int))
   2. [getCellOrCreate(int, int)](#getCellOrCreate(int,int))
   3. [setCell(int, int, IsoMetaCell)](#setCell(int,int,zombie.iso.IsoMetaCell))
   4. [hasCell(int, int)](#hasCell(int,int))
   5. [gridX()](#gridX())
   6. [gridY()](#gridY())
   7. [AddToMeta(IsoGameCharacter)](#AddToMeta(zombie.characters.IsoGameCharacter))
   8. [RemoveFromMeta(IsoPlayer)](#RemoveFromMeta(zombie.characters.IsoPlayer))
   9. [getMinX()](#getMinX())
   10. [getMinY()](#getMinY())
   11. [getMaxX()](#getMaxX())
   12. [getMaxY()](#getMaxY())
   13. [getZoneAt(int, int, int)](#getZoneAt(int,int,int))
   14. [getZonesAt(int, int, int)](#getZonesAt(int,int,int))
   15. [getZonesAt(int, int, int, ArrayList)](#getZonesAt(int,int,int,java.util.ArrayList))
   16. [getZonesIntersecting(int, int, int, int, int)](#getZonesIntersecting(int,int,int,int,int))
   17. [getZonesIntersecting(int, int, int, int, int, ArrayList)](#getZonesIntersecting(int,int,int,int,int,java.util.ArrayList))
   18. [getZoneWithBoundsAndType(int, int, int, int, int, String)](#getZoneWithBoundsAndType(int,int,int,int,int,java.lang.String))
   19. [getVehicleZoneAt(int, int, int)](#getVehicleZoneAt(int,int,int))
   20. [getBuildingAt(int, int)](#getBuildingAt(int,int))
   21. [getBuildingAt(int, int, int)](#getBuildingAt(int,int,int))
   22. [getBuildings()](#getBuildings())
   23. [getRemovedBuildings()](#getRemovedBuildings())
   24. [getAssociatedBuildingAt(int, int)](#getAssociatedBuildingAt(int,int))
   25. [getAssociatedBuildingAt(int, int, IsoDirections)](#getAssociatedBuildingAt(int,int,zombie.iso.IsoDirections))
   26. [getBuildingAtRelax(int, int)](#getBuildingAtRelax(int,int))
   27. [getRoomAt(int, int, int)](#getRoomAt(int,int,int))
   28. [getEmptyOutsideAt(int, int, int)](#getEmptyOutsideAt(int,int,int))
   29. [getRoomDefByID(long)](#getRoomDefByID(long))
   30. [getRoomByID(long)](#getRoomByID(long))
   31. [getBuildingsIntersecting(int, int, int, int, ArrayList)](#getBuildingsIntersecting(int,int,int,int,java.util.ArrayList))
   32. [getRoomsIntersecting(int, int, int, int, ArrayList)](#getRoomsIntersecting(int,int,int,int,java.util.ArrayList))
   33. [countRoomsIntersecting(int, int, int, int)](#countRoomsIntersecting(int,int,int,int))
   34. [countNearbyBuildingsRooms(IsoPlayer)](#countNearbyBuildingsRooms(zombie.characters.IsoPlayer))
   35. [isInside(Zone, BuildingDef)](#isInside(zombie.iso.zones.Zone,zombie.iso.BuildingDef))
   36. [isAdjacent(Zone, Zone)](#isAdjacent(zombie.iso.zones.Zone,zombie.iso.zones.Zone))
   37. [registerZone(String, String, int, int, int, int, int)](#registerZone(java.lang.String,java.lang.String,int,int,int,int,int))
   38. [registerZone(String, String, int, int, int, int, int, ZoneGeometryType, TIntArrayList, int)](#registerZone(java.lang.String,java.lang.String,int,int,int,int,int,zombie.iso.zones.ZoneGeometryType,gnu.trove.list.array.TIntArrayList,int))
   39. [registerZone(Zone)](#registerZone(zombie.iso.zones.Zone))
   40. [registerGeometryZone(String, String, int, String, KahluaTable, KahluaTable)](#registerGeometryZone(java.lang.String,java.lang.String,int,java.lang.String,se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable))
   41. [registerGeometryZone(String, String, int, ZoneGeometryType, TIntArrayList, KahluaTable, int)](#registerGeometryZone(java.lang.String,java.lang.String,int,zombie.iso.zones.ZoneGeometryType,gnu.trove.list.array.TIntArrayList,se.krka.kahlua.vm.KahluaTable,int))
   42. [calculatePolylineOutlineBounds(TIntArrayList, int, int[])](#calculatePolylineOutlineBounds(gnu.trove.list.array.TIntArrayList,int,int%5B%5D))
   43. [registerZoneNoOverlap(String, String, int, int, int, int, int)](#registerZoneNoOverlap(java.lang.String,java.lang.String,int,int,int,int,int))
   44. [addZone(Zone)](#addZone(zombie.iso.zones.Zone))
   45. [removeZone(Zone)](#removeZone(zombie.iso.zones.Zone))
   46. [removeZonesForCell(int, int)](#removeZonesForCell(int,int))
   47. [removeZonesOverlapping(List, int, int)](#removeZonesOverlapping(java.util.List,int,int))
   48. [removeZonesForLotDirectory(String)](#removeZonesForLotDirectory(java.lang.String))
   49. [processZones()](#processZones())
   50. [registerVehiclesZone(String, String, int, int, int, int, int, KahluaTable)](#registerVehiclesZone(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   51. [registerWorldGenZone(String, String, int, int, int, int, int, KahluaTable)](#registerWorldGenZone(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   52. [checkVehiclesZones()](#checkVehiclesZones())
   53. [registerAnimalZone(String, String, int, int, int, int, int, KahluaTable)](#registerAnimalZone(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   54. [registerAnimalZone(AnimalZone)](#registerAnimalZone(zombie.characters.animals.AnimalZone))
   55. [registerAnimalZone(AnimalZone, boolean)](#registerAnimalZone(zombie.characters.animals.AnimalZone,boolean))
   56. [registerMannequinZone(String, String, int, int, int, int, int, KahluaTable)](#registerMannequinZone(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   57. [registerRoomTone(String, String, int, int, int, int, int, KahluaTable)](#registerRoomTone(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   58. [isZoneAbove(Zone, Zone, int, int, int)](#isZoneAbove(zombie.iso.zones.Zone,zombie.iso.zones.Zone,int,int,int))
   59. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   60. [savePart(ByteBuffer, int, boolean)](#savePart(java.nio.ByteBuffer,int,boolean))
   61. [load()](#load())
   62. [load(ByteBuffer)](#load(java.nio.ByteBuffer))
   63. [getWidth()](#getWidth())
   64. [getHeight()](#getHeight())
   65. [wasLoaded()](#wasLoaded())
   66. [getCellData(int, int)](#getCellData(int,int))
   67. [hasCellData(int, int)](#hasCellData(int,int))
   68. [setCellData(int, int, IsoMetaCell)](#setCellData(int,int,zombie.iso.IsoMetaCell))
   69. [getCellDataAbs(int, int)](#getCellDataAbs(int,int))
   70. [getCurrentCellData()](#getCurrentCellData())
   71. [getMetaGridFromTile(int, int)](#getMetaGridFromTile(int,int))
   72. [getCurrentChunkData()](#getCurrentChunkData())
   73. [getChunkData(int, int)](#getChunkData(int,int))
   74. [getChunkDataFromTile(int, int)](#getChunkDataFromTile(int,int))
   75. [isValidSquare(int, int)](#isValidSquare(int,int))
   76. [isValidChunk(int, int)](#isValidChunk(int,int))
   77. [Create()](#Create())
   78. [CreateStep1()](#CreateStep1())
   79. [CreateStep2()](#CreateStep2())
   80. [initIncompleteCells()](#initIncompleteCells())
   81. [initIncompleteCells(MapFiles)](#initIncompleteCells(zombie.iso.MapFiles))
   82. [isChunkLoaded(int, int)](#isChunkLoaded(int,int))
   83. [Dispose()](#Dispose())
   84. [getRandomIndoorCoord()](#getRandomIndoorCoord())
   85. [getRandomRoomBetweenRange(float, float, float, float)](#getRandomRoomBetweenRange(float,float,float,float))
   86. [getRandomRoomNotInRange(float, float, int)](#getRandomRoomNotInRange(float,float,int))
   87. [save()](#save())
   88. [addCellToSave(IsoMetaCell)](#addCellToSave(zombie.iso.IsoMetaCell))
   89. [save(String, Consumer)](#save(java.lang.String,java.util.function.Consumer))
   90. [saveCells(String, String, BiConsumer)](#saveCells(java.lang.String,java.lang.String,java.util.function.BiConsumer))
   91. [saveToBufferMap(SaveBufferMap)](#saveToBufferMap(zombie.iso.SaveBufferMap))
   92. [saveToSaveBufferMap(SaveBufferMap, String, Consumer)](#saveToSaveBufferMap(zombie.iso.SaveBufferMap,java.lang.String,java.util.function.Consumer))
   93. [saveCellsToSaveBufferMap(SaveBufferMap, String, String, BiConsumer)](#saveCellsToSaveBufferMap(zombie.iso.SaveBufferMap,java.lang.String,java.lang.String,java.util.function.BiConsumer))
   94. [load(String, BiConsumer)](#load(java.lang.String,java.util.function.BiConsumer))
   95. [loadCells(String, String, QuadConsumer)](#loadCells(java.lang.String,java.lang.String,zombie.util.lambda.QuadConsumer))
   96. [loadZone(ByteBuffer, int)](#loadZone(java.nio.ByteBuffer,int))
   97. [loadAnimalZones(ByteBuffer, int)](#loadAnimalZones(java.nio.ByteBuffer,int))
   98. [loadStringMap(ByteBuffer)](#loadStringMap(java.nio.ByteBuffer))
   99. [saveZone(ByteBuffer)](#saveZone(java.nio.ByteBuffer))
   100. [saveAnimalZones(ByteBuffer)](#saveAnimalZones(java.nio.ByteBuffer))
   101. [saveStringMap(ByteBuffer, List)](#saveStringMap(java.nio.ByteBuffer,java.util.List))
   102. [getLotDirectories(String, ArrayList)](#getLotDirectories(java.lang.String,java.util.ArrayList))
   103. [getLotDirectories()](#getLotDirectories())
   104. [addRoomsToAdjacentCells(BuildingDef)](#addRoomsToAdjacentCells(zombie.iso.BuildingDef))
   105. [addRoomsToAdjacentCells(BuildingDef, ArrayList)](#addRoomsToAdjacentCells(zombie.iso.BuildingDef,java.util.ArrayList))
   106. [removeRoomsFromAdjacentCells(BuildingDef)](#removeRoomsFromAdjacentCells(zombie.iso.BuildingDef))
   107. [removeRoomsFromAdjacentCells(ArrayList, int, int, int, int, int)](#removeRoomsFromAdjacentCells(java.util.ArrayList,int,int,int,int,int))
   108. [consolidateBuildings()](#consolidateBuildings())
   109. [higherPriority300x300CellExists(int, int, int)](#higherPriority300x300CellExists(int,int,int))
   110. [getZones()](#getZones())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoMetaGrid
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoMetaGrid

---

public final class IsoMetaGrid
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private final class`

  `IsoMetaGrid.MetaGridLoaderThread`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) static Rectangle`

  `a`

  `final zombie.iso.zones.ZoneHandler<AnimalZone>`

  `animalZoneHandler`

  `static final int`

  `ANY_Z`

  `(package private) static Rectangle`

  `b`

  `final ArrayList<BuildingDef>`

  `buildings`

  `private final Set<IsoMetaCell>`

  `cellsToSave`

  `static ByteBuffer`

  `clipperBuffer`

  `static zombie.vehicles.ClipperOffset`

  `clipperOffset`

  `private long`

  `createStartTime`

  `private IsoMetaCell[][]`

  `grid`

  `private int`

  `height`

  `(package private) final ArrayList<Vector2>`

  `highZombieList`

  `static final int`

  `IDEAL_MAX_ZONE_SIZE`

  `private boolean`

  `loaded`

  `int`

  `maxNonProceduralX`

  `int`

  `maxNonProceduralY`

  `int`

  `maxX`

  `int`

  `maxY`

  `final ArrayList<IsoGameCharacter>`

  `metaCharacters`

  `int`

  `minNonProceduralX`

  `int`

  `minNonProceduralY`

  `int`

  `minX`

  `int`

  `minY`

  `private static final int`

  `NUM_LOADER_THREADS`

  `private final ArrayList<zombie.buildingRooms.RemovedBuilding>`

  `removedBuildings`

  `(package private) static ArrayList<RoomDef>`

  `roomChoices`

  `private final zombie.util.SharedStrings`

  `sharedStrings`

  `private final ArrayList<RoomDef>`

  `tempRooms`

  `private final ArrayList<Zone>`

  `tempZones1`

  `private final ArrayList<Zone>`

  `tempZones2`

  `private final IsoMetaGrid.MetaGridLoaderThread[]`

  `threads`

  `static final ThreadLocal<IsoGameCharacter.Location>`

  `TL_Location`

  `private static final ThreadLocal<ArrayList<Zone>>`

  `TL_ZoneList`

  `final ArrayList<VehicleZone>`

  `vehiclesZones`

  `private int`

  `width`

  `final ArrayList<Zone>`

  `zones`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoMetaGrid()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addCellToSave(IsoMetaCell cell)`

  `void`

  `addRoomsToAdjacentCells(BuildingDef buildingDef)`

  `void`

  `addRoomsToAdjacentCells(BuildingDef buildingDef,
  ArrayList<RoomDef> roomDefs)`

  `void`

  `AddToMeta(IsoGameCharacter isoPlayer)`

  `void`

  `addZone(Zone zone)`

  `private void`

  `calculatePolylineOutlineBounds(gnu.trove.list.array.TIntArrayList points,
  int polylineWidth,
  int[] bounds)`

  `void`

  `checkVehiclesZones()`

  `private void`

  `consolidateBuildings()`

  `int`

  `countNearbyBuildingsRooms(IsoPlayer isoPlayer)`

  `int`

  `countRoomsIntersecting(int x,
  int y,
  int w,
  int h)`

  `void`

  `Create()`

  `void`

  `CreateStep1()`

  `void`

  `CreateStep2()`

  `void`

  `Dispose()`

  `BuildingDef`

  `getAssociatedBuildingAt(int x,
  int y)`

  `private BuildingDef`

  `getAssociatedBuildingAt(int x,
  int y,
  IsoDirections dir)`

  `BuildingDef`

  `getBuildingAt(int x,
  int y)`

  `BuildingDef`

  `getBuildingAt(int x,
  int y,
  int z)`

  `BuildingDef`

  `getBuildingAtRelax(int x,
  int y)`

  `ArrayList<BuildingDef>`

  `getBuildings()`

  `void`

  `getBuildingsIntersecting(int x,
  int y,
  int w,
  int h,
  ArrayList<BuildingDef> result)`

  `IsoMetaCell`

  `getCell(int x,
  int y)`

  `IsoMetaCell`

  `getCellData(int x,
  int y)`

  `IsoMetaCell`

  `getCellDataAbs(int x,
  int y)`

  `IsoMetaCell`

  `getCellOrCreate(int x,
  int y)`

  `IsoMetaChunk`

  `getChunkData(int chunkX,
  int chunkY)`

  `IsoMetaChunk`

  `getChunkDataFromTile(int x,
  int y)`

  `IsoMetaCell`

  `getCurrentCellData()`

  `IsoMetaChunk`

  `getCurrentChunkData()`

  `RoomDef`

  `getEmptyOutsideAt(int x,
  int y,
  int z)`

  `int`

  `getHeight()`

  `ArrayList<String>`

  `getLotDirectories()`

  `private void`

  `getLotDirectories(String mapName,
  ArrayList<String> result)`

  `int`

  `getMaxX()`

  `int`

  `getMaxY()`

  `IsoMetaCell`

  `getMetaGridFromTile(int wx,
  int wy)`

  `int`

  `getMinX()`

  `int`

  `getMinY()`

  `Vector2`

  `getRandomIndoorCoord()`

  `RoomDef`

  `getRandomRoomBetweenRange(float x,
  float y,
  float min,
  float max)`

  `RoomDef`

  `getRandomRoomNotInRange(float x,
  float y,
  int range)`

  `ArrayList<zombie.buildingRooms.RemovedBuilding>`

  `getRemovedBuildings()`

  `RoomDef`

  `getRoomAt(int x,
  int y,
  int z)`

  `IsoRoom`

  `getRoomByID(long roomID)`

  `RoomDef`

  `getRoomDefByID(long roomID)`

  `void`

  `getRoomsIntersecting(int x,
  int y,
  int w,
  int h,
  ArrayList<RoomDef> roomDefs)`

  `VehicleZone`

  `getVehicleZoneAt(int x,
  int y,
  int z)`

  `int`

  `getWidth()`

  `Zone`

  `getZoneAt(int x,
  int y,
  int z)`

  `List<Zone>`

  `getZones()`

  `ArrayList<Zone>`

  `getZonesAt(int x,
  int y,
  int z)`

  `ArrayList<Zone>`

  `getZonesAt(int x,
  int y,
  int z,
  ArrayList<Zone> result)`

  `ArrayList<Zone>`

  `getZonesIntersecting(int x,
  int y,
  int z,
  int w,
  int h)`

  `ArrayList<Zone>`

  `getZonesIntersecting(int x,
  int y,
  int z,
  int w,
  int h,
  ArrayList<Zone> result)`

  `Zone`

  `getZoneWithBoundsAndType(int x,
  int y,
  int z,
  int w,
  int h,
  String type)`

  `int`

  `gridX()`

  `int`

  `gridY()`

  `boolean`

  `hasCell(int x,
  int y)`

  `zombie.iso.enums.MetaCellPresence`

  `hasCellData(int x,
  int y)`

  `private boolean`

  `higherPriority300x300CellExists(int priority,
  int cell300X,
  int cell300Y)`

  `private void`

  `initIncompleteCells()`

  `private void`

  `initIncompleteCells(zombie.iso.MapFiles mapFiles)`

  `private boolean`

  `isAdjacent(Zone r1,
  Zone r2)`

  `boolean`

  `isChunkLoaded(int wx,
  int wy)`

  `private boolean`

  `isInside(Zone r1,
  BuildingDef r2)`

  `boolean`

  `isValidChunk(int wx,
  int wy)`

  `boolean`

  `isValidSquare(int x,
  int y)`

  `boolean`

  `isZoneAbove(Zone zone1,
  Zone zone2,
  int x,
  int y,
  int z)`

  `void`

  `load()`

  `void`

  `load(String inFilePath,
  BiConsumer<ByteBuffer, Integer> loadMethod)`

  `void`

  `load(ByteBuffer input)`

  `void`

  `loadAnimalZones(ByteBuffer input,
  int worldVersion)`

  `void`

  `loadCells(String path,
  String filter,
  zombie.util.lambda.QuadConsumer<IsoMetaCell, IsoMetaGrid, ByteBuffer, Integer> loadMethod)`

  `private HashMap<Integer,String>`

  `loadStringMap(ByteBuffer input)`

  `void`

  `loadZone(ByteBuffer input,
  int worldVersion)`

  `void`

  `processZones()`

  `Zone`

  `registerAnimalZone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  `Zone`

  `registerAnimalZone(AnimalZone animalZone)`

  `Zone`

  `registerAnimalZone(AnimalZone animalZone,
  boolean bHotSave)`

  `Zone`

  `registerGeometryZone(String name,
  String type,
  int z,
  String geometry,
  se.krka.kahlua.vm.KahluaTable pointsTable,
  se.krka.kahlua.vm.KahluaTable properties)`

  `Zone`

  `registerGeometryZone(String name,
  String type,
  int z,
  zombie.iso.zones.ZoneGeometryType geometryType,
  gnu.trove.list.array.TIntArrayList points,
  se.krka.kahlua.vm.KahluaTable properties,
  int width)`

  `Zone`

  `registerMannequinZone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  `void`

  `registerRoomTone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  `Zone`

  `registerVehiclesZone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  `Zone`

  `registerWorldGenZone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  se.krka.kahlua.vm.KahluaTable properties)`

  `Zone`

  `registerZone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height)`

  `Zone`

  `registerZone(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height,
  zombie.iso.zones.ZoneGeometryType geometryType,
  gnu.trove.list.array.TIntArrayList points,
  int polylineWidth)`

  `Zone`

  `registerZone(Zone zone)`

  `Zone`

  `registerZoneNoOverlap(String name,
  String type,
  int x,
  int y,
  int z,
  int width,
  int height)`

  Deprecated.

  `void`

  `RemoveFromMeta(IsoPlayer isoPlayer)`

  `void`

  `removeRoomsFromAdjacentCells(ArrayList<RoomDef> rooms,
  int cellX1,
  int cellY1,
  int cellX2,
  int cellY2,
  int userDefined)`

  `void`

  `removeRoomsFromAdjacentCells(BuildingDef buildingDef)`

  `void`

  `removeZone(Zone zone)`

  `private void`

  `removeZonesForCell(int cell300X,
  int cell300Y)`

  `void`

  `removeZonesForLotDirectory(String lotDir)`

  `private void`

  `removeZonesOverlapping(List<? extends Zone> zones,
  int cell300X,
  int cell300Y)`

  `void`

  `save()`

  `private void`

  `save(String outFilePath,
  Consumer<ByteBuffer> saveMethod)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `saveAnimalZones(ByteBuffer output)`

  `private void`

  `saveCells(String path,
  String filter,
  BiConsumer<IsoMetaCell, ByteBuffer> saveMethod)`

  `void`

  `saveCellsToSaveBufferMap(zombie.iso.SaveBufferMap bufferMap,
  String path,
  String filter,
  BiConsumer<IsoMetaCell, ByteBuffer> saveMethod)`

  `void`

  `savePart(ByteBuffer output,
  int part,
  boolean fromServer)`

  `private HashMap<String,Integer>`

  `saveStringMap(ByteBuffer output,
  List<? extends Zone> zones)`

  `void`

  `saveToBufferMap(zombie.iso.SaveBufferMap bufferMap)`

  `void`

  `saveToSaveBufferMap(zombie.iso.SaveBufferMap bufferMap,
  String fileName,
  Consumer<ByteBuffer> saveMethod)`

  `void`

  `saveZone(ByteBuffer output)`

  `void`

  `setCell(int x,
  int y,
  IsoMetaCell cell)`

  `void`

  `setCellData(int x,
  int y,
  IsoMetaCell cell)`

  `boolean`

  `wasLoaded()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### NUM\_LOADER\_THREADS

    private static final int NUM\_LOADER\_THREADS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoMetaGrid.NUM_LOADER_THREADS)
  + ### ANY\_Z

    public static final int ANY\_Z

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoMetaGrid.ANY_Z)
  + ### clipperOffset

    public static zombie.vehicles.ClipperOffset clipperOffset
  + ### clipperBuffer

    public static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") clipperBuffer
  + ### TL\_ZoneList

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")>> TL\_ZoneList
  + ### TL\_Location

    public static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[IsoGameCharacter.Location](../characters/IsoGameCharacter.Location.html "class in zombie.characters")> TL\_Location
  + ### a

    static [Rectangle](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/Rectangle.html "class or interface in java.awt") a
  + ### b

    static [Rectangle](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/Rectangle.html "class or interface in java.awt") b
  + ### roomChoices

    static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> roomChoices
  + ### tempRooms

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> tempRooms
  + ### tempZones1

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> tempZones1
  + ### tempZones2

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> tempZones2
  + ### threads

    private final [IsoMetaGrid.MetaGridLoaderThread](IsoMetaGrid.MetaGridLoaderThread.html "class in zombie.iso")[] threads
  + ### minX

    public int minX
  + ### minY

    public int minY
  + ### maxX

    public int maxX
  + ### maxY

    public int maxY
  + ### minNonProceduralX

    public int minNonProceduralX
  + ### minNonProceduralY

    public int minNonProceduralY
  + ### maxNonProceduralX

    public int maxNonProceduralX
  + ### maxNonProceduralY

    public int maxNonProceduralY
  + ### zones

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> zones
  + ### buildings

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BuildingDef](BuildingDef.html "class in zombie.iso")> buildings
  + ### vehiclesZones

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleZone](zones/VehicleZone.html "class in zombie.iso.zones")> vehiclesZones
  + ### animalZoneHandler

    public final zombie.iso.zones.ZoneHandler<[AnimalZone](../characters/animals/AnimalZone.html "class in zombie.characters.animals")> animalZoneHandler
  + ### grid

    private [IsoMetaCell](IsoMetaCell.html "class in zombie.iso")[][] grid
  + ### cellsToSave

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoMetaCell](IsoMetaCell.html "class in zombie.iso")> cellsToSave
  + ### metaCharacters

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters")> metaCharacters
  + ### highZombieList

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Vector2](Vector2.html "class in zombie.iso")> highZombieList
  + ### width

    private int width
  + ### height

    private int height
  + ### sharedStrings

    private final zombie.util.SharedStrings sharedStrings
  + ### createStartTime

    private long createStartTime
  + ### loaded

    private boolean loaded
  + ### removedBuildings

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.buildingRooms.RemovedBuilding> removedBuildings
  + ### IDEAL\_MAX\_ZONE\_SIZE

    public static final int IDEAL\_MAX\_ZONE\_SIZE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoMetaGrid.IDEAL_MAX_ZONE_SIZE)
* Constructor Details
  -------------------

  + ### IsoMetaGrid

    public IsoMetaGrid()
* Method Details
  --------------

  + ### getCell

    public [IsoMetaCell](IsoMetaCell.html "class in zombie.iso") getCell(int x,
    int y)
  + ### getCellOrCreate

    public [IsoMetaCell](IsoMetaCell.html "class in zombie.iso") getCellOrCreate(int x,
    int y)
  + ### setCell

    public void setCell(int x,
    int y,
    [IsoMetaCell](IsoMetaCell.html "class in zombie.iso") cell)
  + ### hasCell

    public boolean hasCell(int x,
    int y)
  + ### gridX

    public int gridX()
  + ### gridY

    public int gridY()
  + ### AddToMeta

    public void AddToMeta([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoPlayer)
  + ### RemoveFromMeta

    public void RemoveFromMeta([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") isoPlayer)
  + ### getMinX

    public int getMinX()
  + ### getMinY

    public int getMinY()
  + ### getMaxX

    public int getMaxX()
  + ### getMaxY

    public int getMaxY()
  + ### getZoneAt

    public [Zone](zones/Zone.html "class in zombie.iso.zones") getZoneAt(int x,
    int y,
    int z)
  + ### getZonesAt

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> getZonesAt(int x,
    int y,
    int z)
  + ### getZonesAt

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> getZonesAt(int x,
    int y,
    int z,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> result)
  + ### getZonesIntersecting

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> getZonesIntersecting(int x,
    int y,
    int z,
    int w,
    int h)
  + ### getZonesIntersecting

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> getZonesIntersecting(int x,
    int y,
    int z,
    int w,
    int h,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> result)
  + ### getZoneWithBoundsAndType

    public [Zone](zones/Zone.html "class in zombie.iso.zones") getZoneWithBoundsAndType(int x,
    int y,
    int z,
    int w,
    int h,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getVehicleZoneAt

    public [VehicleZone](zones/VehicleZone.html "class in zombie.iso.zones") getVehicleZoneAt(int x,
    int y,
    int z)
  + ### getBuildingAt

    public [BuildingDef](BuildingDef.html "class in zombie.iso") getBuildingAt(int x,
    int y)
  + ### getBuildingAt

    public [BuildingDef](BuildingDef.html "class in zombie.iso") getBuildingAt(int x,
    int y,
    int z)
  + ### getBuildings

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BuildingDef](BuildingDef.html "class in zombie.iso")> getBuildings()
  + ### getRemovedBuildings

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.buildingRooms.RemovedBuilding> getRemovedBuildings()
  + ### getAssociatedBuildingAt

    public [BuildingDef](BuildingDef.html "class in zombie.iso") getAssociatedBuildingAt(int x,
    int y)
  + ### getAssociatedBuildingAt

    private [BuildingDef](BuildingDef.html "class in zombie.iso") getAssociatedBuildingAt(int x,
    int y,
    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### getBuildingAtRelax

    public [BuildingDef](BuildingDef.html "class in zombie.iso") getBuildingAtRelax(int x,
    int y)
  + ### getRoomAt

    public [RoomDef](RoomDef.html "class in zombie.iso") getRoomAt(int x,
    int y,
    int z)
  + ### getEmptyOutsideAt

    public [RoomDef](RoomDef.html "class in zombie.iso") getEmptyOutsideAt(int x,
    int y,
    int z)
  + ### getRoomDefByID

    public [RoomDef](RoomDef.html "class in zombie.iso") getRoomDefByID(long roomID)
  + ### getRoomByID

    public [IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") getRoomByID(long roomID)
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
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> roomDefs)
  + ### countRoomsIntersecting

    public int countRoomsIntersecting(int x,
    int y,
    int w,
    int h)
  + ### countNearbyBuildingsRooms

    public int countNearbyBuildingsRooms([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") isoPlayer)
  + ### isInside

    private boolean isInside([Zone](zones/Zone.html "class in zombie.iso.zones") r1,
    [BuildingDef](BuildingDef.html "class in zombie.iso") r2)
  + ### isAdjacent

    private boolean isAdjacent([Zone](zones/Zone.html "class in zombie.iso.zones") r1,
    [Zone](zones/Zone.html "class in zombie.iso.zones") r2)
  + ### registerZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height)
  + ### registerZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    zombie.iso.zones.ZoneGeometryType geometryType,
    gnu.trove.list.array.TIntArrayList points,
    int polylineWidth)
  + ### registerZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerZone([Zone](zones/Zone.html "class in zombie.iso.zones") zone)
  + ### registerGeometryZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerGeometryZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") geometry,
    se.krka.kahlua.vm.KahluaTable pointsTable,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### registerGeometryZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerGeometryZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int z,
    zombie.iso.zones.ZoneGeometryType geometryType,
    gnu.trove.list.array.TIntArrayList points,
    se.krka.kahlua.vm.KahluaTable properties,
    int width)
  + ### calculatePolylineOutlineBounds

    private void calculatePolylineOutlineBounds(gnu.trove.list.array.TIntArrayList points,
    int polylineWidth,
    int[] bounds)
  + ### registerZoneNoOverlap

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerZoneNoOverlap([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height)

    Deprecated.
  + ### addZone

    public void addZone([Zone](zones/Zone.html "class in zombie.iso.zones") zone)
  + ### removeZone

    public void removeZone([Zone](zones/Zone.html "class in zombie.iso.zones") zone)
  + ### removeZonesForCell

    private void removeZonesForCell(int cell300X,
    int cell300Y)
  + ### removeZonesOverlapping

    private void removeZonesOverlapping([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<? extends [Zone](zones/Zone.html "class in zombie.iso.zones")> zones,
    int cell300X,
    int cell300Y)
  + ### removeZonesForLotDirectory

    public void removeZonesForLotDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lotDir)
  + ### processZones

    public void processZones()
  + ### registerVehiclesZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerVehiclesZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### registerWorldGenZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerWorldGenZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### checkVehiclesZones

    public void checkVehiclesZones()
  + ### registerAnimalZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerAnimalZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### registerAnimalZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerAnimalZone([AnimalZone](../characters/animals/AnimalZone.html "class in zombie.characters.animals") animalZone)
  + ### registerAnimalZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerAnimalZone([AnimalZone](../characters/animals/AnimalZone.html "class in zombie.characters.animals") animalZone,
    boolean bHotSave)
  + ### registerMannequinZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") registerMannequinZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### registerRoomTone

    public void registerRoomTone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int width,
    int height,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### isZoneAbove

    public boolean isZoneAbove([Zone](zones/Zone.html "class in zombie.iso.zones") zone1,
    [Zone](zones/Zone.html "class in zombie.iso.zones") zone2,
    int x,
    int y,
    int z)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### savePart

    public void savePart([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    int part,
    boolean fromServer)
  + ### load

    public void load()
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
  + ### getWidth

    public int getWidth()
  + ### getHeight

    public int getHeight()
  + ### wasLoaded

    public boolean wasLoaded()
  + ### getCellData

    public [IsoMetaCell](IsoMetaCell.html "class in zombie.iso") getCellData(int x,
    int y)
  + ### hasCellData

    public zombie.iso.enums.MetaCellPresence hasCellData(int x,
    int y)
  + ### setCellData

    public void setCellData(int x,
    int y,
    [IsoMetaCell](IsoMetaCell.html "class in zombie.iso") cell)
  + ### getCellDataAbs

    public [IsoMetaCell](IsoMetaCell.html "class in zombie.iso") getCellDataAbs(int x,
    int y)
  + ### getCurrentCellData

    public [IsoMetaCell](IsoMetaCell.html "class in zombie.iso") getCurrentCellData()
  + ### getMetaGridFromTile

    public [IsoMetaCell](IsoMetaCell.html "class in zombie.iso") getMetaGridFromTile(int wx,
    int wy)
  + ### getCurrentChunkData

    public [IsoMetaChunk](IsoMetaChunk.html "class in zombie.iso") getCurrentChunkData()
  + ### getChunkData

    public [IsoMetaChunk](IsoMetaChunk.html "class in zombie.iso") getChunkData(int chunkX,
    int chunkY)
  + ### getChunkDataFromTile

    public [IsoMetaChunk](IsoMetaChunk.html "class in zombie.iso") getChunkDataFromTile(int x,
    int y)
  + ### isValidSquare

    public boolean isValidSquare(int x,
    int y)
  + ### isValidChunk

    public boolean isValidChunk(int wx,
    int wy)
  + ### Create

    public void Create()
  + ### CreateStep1

    public void CreateStep1()
  + ### CreateStep2

    public void CreateStep2()
  + ### initIncompleteCells

    private void initIncompleteCells()
  + ### initIncompleteCells

    private void initIncompleteCells(zombie.iso.MapFiles mapFiles)
  + ### isChunkLoaded

    public boolean isChunkLoaded(int wx,
    int wy)
  + ### Dispose

    public void Dispose()
  + ### getRandomIndoorCoord

    public [Vector2](Vector2.html "class in zombie.iso") getRandomIndoorCoord()
  + ### getRandomRoomBetweenRange

    public [RoomDef](RoomDef.html "class in zombie.iso") getRandomRoomBetweenRange(float x,
    float y,
    float min,
    float max)
  + ### getRandomRoomNotInRange

    public [RoomDef](RoomDef.html "class in zombie.iso") getRandomRoomNotInRange(float x,
    float y,
    int range)
  + ### save

    public void save()
  + ### addCellToSave

    public void addCellToSave([IsoMetaCell](IsoMetaCell.html "class in zombie.iso") cell)
  + ### save

    private void save([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outFilePath,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<[ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")> saveMethod)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### saveCells

    private void saveCells([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    [BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<[IsoMetaCell](IsoMetaCell.html "class in zombie.iso"), [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")> saveMethod)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### saveToBufferMap

    public void saveToBufferMap(zombie.iso.SaveBufferMap bufferMap)
  + ### saveToSaveBufferMap

    public void saveToSaveBufferMap(zombie.iso.SaveBufferMap bufferMap,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<[ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")> saveMethod)
  + ### saveCellsToSaveBufferMap

    public void saveCellsToSaveBufferMap(zombie.iso.SaveBufferMap bufferMap,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    [BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<[IsoMetaCell](IsoMetaCell.html "class in zombie.iso"), [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")> saveMethod)
  + ### load

    public void load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inFilePath,
    [BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<[ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> loadMethod)
  + ### loadCells

    public void loadCells([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    zombie.util.lambda.QuadConsumer<[IsoMetaCell](IsoMetaCell.html "class in zombie.iso"), [IsoMetaGrid](IsoMetaGrid.html "class in zombie.iso"), [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> loadMethod)
  + ### loadZone

    public void loadZone([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### loadAnimalZones

    public void loadAnimalZones([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### loadStringMap

    private [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadStringMap([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
  + ### saveZone

    public void saveZone([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### saveAnimalZones

    public void saveAnimalZones([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### saveStringMap

    private [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> saveStringMap([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<? extends [Zone](zones/Zone.html "class in zombie.iso.zones")> zones)
  + ### getLotDirectories

    private void getLotDirectories([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapName,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> result)
  + ### getLotDirectories

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLotDirectories()
  + ### addRoomsToAdjacentCells

    public void addRoomsToAdjacentCells([BuildingDef](BuildingDef.html "class in zombie.iso") buildingDef)
  + ### addRoomsToAdjacentCells

    public void addRoomsToAdjacentCells([BuildingDef](BuildingDef.html "class in zombie.iso") buildingDef,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> roomDefs)
  + ### removeRoomsFromAdjacentCells

    public void removeRoomsFromAdjacentCells([BuildingDef](BuildingDef.html "class in zombie.iso") buildingDef)
  + ### removeRoomsFromAdjacentCells

    public void removeRoomsFromAdjacentCells([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> rooms,
    int cellX1,
    int cellY1,
    int cellX2,
    int cellY2,
    int userDefined)
  + ### consolidateBuildings

    private void consolidateBuildings()
  + ### higherPriority300x300CellExists

    private boolean higherPriority300x300CellExists(int priority,
    int cell300X,
    int cell300Y)
  + ### getZones

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> getZones()