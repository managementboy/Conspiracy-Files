[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.basements](package-summary.html)
2. [Basements](Basements.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [basementDefinitions](#basementDefinitions)
   3. [basementDefinitionByName](#basementDefinitionByName)
   4. [basementAccessDefinitions](#basementAccessDefinitions)
   5. [basementAccessDefinitionByName](#basementAccessDefinitionByName)
   6. [basementSpawnLocations](#basementSpawnLocations)
   7. [basementPlacements](#basementPlacements)
   8. [basementsPerMap](#basementsPerMap)
   9. [apiV1](#apiV1)
   10. [SAVEFILE\_VERSION](#SAVEFILE_VERSION)
   11. [FILE\_MAGIC](#FILE_MAGIC)
   12. [buildingDefs](#buildingDefs)
   13. [tempBuildingDefs](#tempBuildingDefs)
   14. [tempRooms](#tempRooms)
   15. [mergedRooms](#mergedRooms)
7. [Constructor Details](#constructor-detail)
   1. [Basements()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [getAPIv1()](#getAPIv1())
   3. [getPerMap(String)](#getPerMap(java.lang.String))
   4. [getOrCreatePerMap(String)](#getOrCreatePerMap(java.lang.String))
   5. [beforeOnLoadMapZones()](#beforeOnLoadMapZones())
   6. [beforeLoadMetaGrid()](#beforeLoadMetaGrid())
   7. [afterLoadMetaGrid()](#afterLoadMetaGrid())
   8. [loadSavefile()](#loadSavefile())
   9. [loadSavefile(File, DataInputStream)](#loadSavefile(java.io.File,java.io.DataInputStream))
   10. [writeSavefile()](#writeSavefile())
   11. [writeSavefile(DataOutputStream)](#writeSavefile(java.io.DataOutputStream))
   12. [parseBasementDefinitions()](#parseBasementDefinitions())
   13. [parseBasementAccessDefinitions()](#parseBasementAccessDefinitions())
   14. [parseBasementSpawnLocations()](#parseBasementSpawnLocations())
   15. [calculateBasementPlacements()](#calculateBasementPlacements())
   16. [calculateBasementPlacements(BasementOverlap, BasementsPerMap, RandInterface)](#calculateBasementPlacements(zombie.basements.BasementOverlap,zombie.basements.BasementsPerMap,zombie.core.random.RandInterface))
   17. [canPlaceAt(String, BasementDefinition, BasementSpawnLocation, BasementOverlap)](#canPlaceAt(java.lang.String,zombie.basements.BasementDefinition,zombie.basements.BasementSpawnLocation,zombie.basements.BasementOverlap))
   18. [isCellFromThisMap(String, int, int)](#isCellFromThisMap(java.lang.String,int,int))
   19. [chunkHasBasement(IsoChunk)](#chunkHasBasement(zombie.iso.IsoChunk))
   20. [onNewChunkLoaded(IsoChunk)](#onNewChunkLoaded(zombie.iso.IsoChunk))
   21. [chunkOverlaps(IsoChunk, int, int, int, int)](#chunkOverlaps(zombie.iso.IsoChunk,int,int,int,int))
   22. [loadBasementDefinitionHeaders()](#loadBasementDefinitionHeaders())
   23. [loadBasementAccessDefinitionHeaders()](#loadBasementAccessDefinitionHeaders())
   24. [createBasementBuildingDefs()](#createBasementBuildingDefs())
   25. [getBuildingToMergeWith(BuildingDef)](#getBuildingToMergeWith(zombie.iso.BuildingDef))
   26. [removeBuildingFromMetaCell(BuildingDef, IsoMetaCell)](#removeBuildingFromMetaCell(zombie.iso.BuildingDef,zombie.iso.IsoMetaCell))
   27. [recalculateBuildingAndRoomIDs(IsoMetaCell)](#recalculateBuildingAndRoomIDs(zombie.iso.IsoMetaCell))
   28. [mergeRoomsOntoMetaCell(ArrayList, IsoMetaCell)](#mergeRoomsOntoMetaCell(java.util.ArrayList,zombie.iso.IsoMetaCell))
   29. [mergeBuildings(BuildingDef, BuildingDef)](#mergeBuildings(zombie.iso.BuildingDef,zombie.iso.BuildingDef))
   30. [addBasementBuildingDefsToLotHeaders()](#addBasementBuildingDefsToLotHeaders())
   31. [addBasementBuildingDefsToMetaGrid()](#addBasementBuildingDefsToMetaGrid())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Basements
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.basements.Basements

---

public final class Basements
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `Basements.MergedRooms`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final BasementsV1`

  `apiV1`

  `(package private) final HashMap<String, zombie.basements.BasementDefinition>`

  `basementAccessDefinitionByName`

  `(package private) final ArrayList<zombie.basements.BasementDefinition>`

  `basementAccessDefinitions`

  `(package private) final HashMap<String, zombie.basements.BasementDefinition>`

  `basementDefinitionByName`

  `(package private) final ArrayList<zombie.basements.BasementDefinition>`

  `basementDefinitions`

  `(package private) final ArrayList<zombie.basements.BasementPlacement>`

  `basementPlacements`

  `(package private) final ArrayList<zombie.basements.BasementSpawnLocation>`

  `basementSpawnLocations`

  `private final HashMap<String, zombie.basements.BasementsPerMap>`

  `basementsPerMap`

  `private final ArrayList<BuildingDef>`

  `buildingDefs`

  `private static final byte[]`

  `FILE_MAGIC`

  `private static Basements`

  `instance`

  `private final HashMap<BuildingDef, Basements.MergedRooms>`

  `mergedRooms`

  `static final int`

  `SAVEFILE_VERSION`

  `private final ArrayList<BuildingDef>`

  `tempBuildingDefs`

  `private final ArrayList<RoomDef>`

  `tempRooms`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Basements()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `addBasementBuildingDefsToLotHeaders()`

  `(package private) void`

  `addBasementBuildingDefsToMetaGrid()`

  `void`

  `afterLoadMetaGrid()`

  `void`

  `beforeLoadMetaGrid()`

  `void`

  `beforeOnLoadMapZones()`

  `(package private) void`

  `calculateBasementPlacements()`

  `(package private) void`

  `calculateBasementPlacements(zombie.basements.BasementOverlap overlap,
  zombie.basements.BasementsPerMap basementsPerMap1,
  zombie.core.random.RandInterface rnd)`

  `(package private) boolean`

  `canPlaceAt(String mapID,
  zombie.basements.BasementDefinition basementDefinition,
  zombie.basements.BasementSpawnLocation basementSpawnLocation,
  zombie.basements.BasementOverlap overlap)`

  `boolean`

  `chunkHasBasement(IsoChunk chunk)`

  `(package private) boolean`

  `chunkOverlaps(IsoChunk chunk,
  int x,
  int y,
  int w,
  int h)`

  `(package private) void`

  `createBasementBuildingDefs()`

  `static BasementsV1`

  `getAPIv1()`

  `private BuildingDef`

  `getBuildingToMergeWith(BuildingDef buildingDef)`

  `static Basements`

  `getInstance()`

  `zombie.basements.BasementsPerMap`

  `getOrCreatePerMap(String mapID)`

  `zombie.basements.BasementsPerMap`

  `getPerMap(String mapID)`

  `(package private) boolean`

  `isCellFromThisMap(String mapID,
  int spawnX,
  int spawnY)`

  `(package private) void`

  `loadBasementAccessDefinitionHeaders()`

  `(package private) void`

  `loadBasementDefinitionHeaders()`

  `(package private) boolean`

  `loadSavefile()`

  `(package private) void`

  `loadSavefile(File file,
  DataInputStream in)`

  `private void`

  `mergeBuildings(BuildingDef buildingDef,
  BuildingDef mergeDef)`

  `private void`

  `mergeRoomsOntoMetaCell(ArrayList<RoomDef> rooms,
  IsoMetaCell metaCell)`

  `void`

  `onNewChunkLoaded(IsoChunk chunk)`

  `void`

  `parseBasementAccessDefinitions()`

  `void`

  `parseBasementDefinitions()`

  `(package private) void`

  `parseBasementSpawnLocations()`

  `(package private) void`

  `recalculateBuildingAndRoomIDs(IsoMetaCell metaCell)`

  `private void`

  `removeBuildingFromMetaCell(BuildingDef buildingDef,
  IsoMetaCell metaCell)`

  `(package private) void`

  `writeSavefile()`

  `(package private) void`

  `writeSavefile(DataOutputStream out)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [Basements](Basements.html "class in zombie.basements") instance
  + ### basementDefinitions

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.basements.BasementDefinition> basementDefinitions
  + ### basementDefinitionByName

    final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.basements.BasementDefinition> basementDefinitionByName
  + ### basementAccessDefinitions

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.basements.BasementDefinition> basementAccessDefinitions
  + ### basementAccessDefinitionByName

    final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.basements.BasementDefinition> basementAccessDefinitionByName
  + ### basementSpawnLocations

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.basements.BasementSpawnLocation> basementSpawnLocations
  + ### basementPlacements

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.basements.BasementPlacement> basementPlacements
  + ### basementsPerMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.basements.BasementsPerMap> basementsPerMap
  + ### apiV1

    private final [BasementsV1](BasementsV1.html "class in zombie.basements") apiV1
  + ### SAVEFILE\_VERSION

    public static final int SAVEFILE\_VERSION

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.basements.Basements.SAVEFILE_VERSION)
  + ### FILE\_MAGIC

    private static final byte[] FILE\_MAGIC
  + ### buildingDefs

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BuildingDef](../iso/BuildingDef.html "class in zombie.iso")> buildingDefs
  + ### tempBuildingDefs

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BuildingDef](../iso/BuildingDef.html "class in zombie.iso")> tempBuildingDefs
  + ### tempRooms

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](../iso/RoomDef.html "class in zombie.iso")> tempRooms
  + ### mergedRooms

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[BuildingDef](../iso/BuildingDef.html "class in zombie.iso"), [Basements.MergedRooms](Basements.MergedRooms.html "class in zombie.basements")> mergedRooms
* Constructor Details
  -------------------

  + ### Basements

    public Basements()
* Method Details
  --------------

  + ### getInstance

    public static [Basements](Basements.html "class in zombie.basements") getInstance()
  + ### getAPIv1

    public static [BasementsV1](BasementsV1.html "class in zombie.basements") getAPIv1()
  + ### getPerMap

    public zombie.basements.BasementsPerMap getPerMap([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapID)
  + ### getOrCreatePerMap

    public zombie.basements.BasementsPerMap getOrCreatePerMap([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapID)
  + ### beforeOnLoadMapZones

    public void beforeOnLoadMapZones()
  + ### beforeLoadMetaGrid

    public void beforeLoadMetaGrid()
  + ### afterLoadMetaGrid

    public void afterLoadMetaGrid()
  + ### loadSavefile

    boolean loadSavefile()
  + ### loadSavefile

    void loadSavefile([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") file,
    [DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") in)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### writeSavefile

    void writeSavefile()
  + ### writeSavefile

    void writeSavefile([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") out)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### parseBasementDefinitions

    public void parseBasementDefinitions()
  + ### parseBasementAccessDefinitions

    public void parseBasementAccessDefinitions()
  + ### parseBasementSpawnLocations

    void parseBasementSpawnLocations()
  + ### calculateBasementPlacements

    void calculateBasementPlacements()
  + ### calculateBasementPlacements

    void calculateBasementPlacements(zombie.basements.BasementOverlap overlap,
    zombie.basements.BasementsPerMap basementsPerMap1,
    zombie.core.random.RandInterface rnd)
  + ### canPlaceAt

    boolean canPlaceAt([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapID,
    zombie.basements.BasementDefinition basementDefinition,
    zombie.basements.BasementSpawnLocation basementSpawnLocation,
    zombie.basements.BasementOverlap overlap)
  + ### isCellFromThisMap

    boolean isCellFromThisMap([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapID,
    int spawnX,
    int spawnY)
  + ### chunkHasBasement

    public boolean chunkHasBasement([IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk)
  + ### onNewChunkLoaded

    public void onNewChunkLoaded([IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk)
  + ### chunkOverlaps

    boolean chunkOverlaps([IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk,
    int x,
    int y,
    int w,
    int h)
  + ### loadBasementDefinitionHeaders

    void loadBasementDefinitionHeaders()
  + ### loadBasementAccessDefinitionHeaders

    void loadBasementAccessDefinitionHeaders()
  + ### createBasementBuildingDefs

    void createBasementBuildingDefs()
  + ### getBuildingToMergeWith

    private [BuildingDef](../iso/BuildingDef.html "class in zombie.iso") getBuildingToMergeWith([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") buildingDef)
  + ### removeBuildingFromMetaCell

    private void removeBuildingFromMetaCell([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") buildingDef,
    [IsoMetaCell](../iso/IsoMetaCell.html "class in zombie.iso") metaCell)
  + ### recalculateBuildingAndRoomIDs

    void recalculateBuildingAndRoomIDs([IsoMetaCell](../iso/IsoMetaCell.html "class in zombie.iso") metaCell)
  + ### mergeRoomsOntoMetaCell

    private void mergeRoomsOntoMetaCell([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](../iso/RoomDef.html "class in zombie.iso")> rooms,
    [IsoMetaCell](../iso/IsoMetaCell.html "class in zombie.iso") metaCell)
  + ### mergeBuildings

    private void mergeBuildings([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") buildingDef,
    [BuildingDef](../iso/BuildingDef.html "class in zombie.iso") mergeDef)
  + ### addBasementBuildingDefsToLotHeaders

    void addBasementBuildingDefsToLotHeaders()
  + ### addBasementBuildingDefsToMetaGrid

    void addBasementBuildingDefsToMetaGrid()