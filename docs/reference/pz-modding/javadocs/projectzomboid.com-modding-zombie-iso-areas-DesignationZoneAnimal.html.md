[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.areas](package-summary.html)
2. [DesignationZoneAnimal](DesignationZoneAnimal.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [designationAnimalZoneList](#designationAnimalZoneList)
   2. [ZONE\_TYPE](#ZONE_TYPE)
   3. [ZONE\_COLOR\_R](#ZONE_COLOR_R)
   4. [ZONE\_COLOR\_G](#ZONE_COLOR_G)
   5. [ZONE\_COLOR\_B](#ZONE_COLOR_B)
   6. [ZONE\_SELECTED\_COLOR\_R](#ZONE_SELECTED_COLOR_R)
   7. [ZONE\_SELECTED\_COLOR\_G](#ZONE_SELECTED_COLOR_G)
   8. [ZONE\_SELECTED\_COLOR\_B](#ZONE_SELECTED_COLOR_B)
   9. [animals](#animals)
   10. [corpses](#corpses)
   11. [troughs](#troughs)
   12. [hutchs](#hutchs)
   13. [foodOnGround](#foodOnGround)
   14. [nearWaterSquares](#nearWaterSquares)
   15. [nbOfDung](#nbOfDung)
   16. [nbOfFeather](#nbOfFeather)
   17. [roofAreas](#roofAreas)
   18. [position3dPool](#position3dPool)
   19. [FENCE\_WEST](#FENCE_WEST)
   20. [FENCE\_NORTH](#FENCE_NORTH)
   21. [FENCE\_NORTHCORNER](#FENCE_NORTHCORNER)
6. [Constructor Details](#constructor-detail)
   1. [DesignationZoneAnimal(String, int, int, int, int, int, boolean)](#%3Cinit%3E(java.lang.String,int,int,int,int,int,boolean))
7. [Method Details](#method-detail)
   1. [getAllDZones(ArrayList, DesignationZoneAnimal, DesignationZoneAnimal)](#getAllDZones(java.util.ArrayList,zombie.iso.areas.DesignationZoneAnimal,zombie.iso.areas.DesignationZoneAnimal))
   2. [createSurroundingFence()](#createSurroundingFence())
   3. [isItemFood(IsoWorldInventoryObject)](#isItemFood(zombie.iso.objects.IsoWorldInventoryObject))
   4. [isItemDung(IsoWorldInventoryObject)](#isItemDung(zombie.iso.objects.IsoWorldInventoryObject))
   5. [isItemFeather(IsoWorldInventoryObject)](#isItemFeather(zombie.iso.objects.IsoWorldInventoryObject))
   6. [addItemOnGround(IsoWorldInventoryObject, IsoGridSquare)](#addItemOnGround(zombie.iso.objects.IsoWorldInventoryObject,zombie.iso.IsoGridSquare))
   7. [addFoodOnGround(IsoWorldInventoryObject)](#addFoodOnGround(zombie.iso.objects.IsoWorldInventoryObject))
   8. [check()](#check())
   9. [reAttachAnimal()](#reAttachAnimal())
   10. [doMeta(int)](#doMeta(int))
   11. [getType()](#getType())
   12. [getAllZones()](#getAllZones())
   13. [getZone(int, int, int)](#getZone(int,int,int))
   14. [getZoneById(double)](#getZoneById(double))
   15. [getZoneF(float, float, float)](#getZoneF(float,float,float))
   16. [getZone(int, int)](#getZone(int,int))
   17. [removeZone(DesignationZoneAnimal, boolean)](#removeZone(zombie.iso.areas.DesignationZoneAnimal,boolean))
   18. [removeItemFromGround(IsoWorldInventoryObject)](#removeItemFromGround(zombie.iso.objects.IsoWorldInventoryObject))
   19. [addAnimal(IsoAnimal)](#addAnimal(zombie.characters.animals.IsoAnimal))
   20. [removeAnimal(IsoAnimal)](#removeAnimal(zombie.characters.animals.IsoAnimal))
   21. [addCorpse(IsoDeadBody)](#addCorpse(zombie.iso.objects.IsoDeadBody))
   22. [removeCorpse(IsoDeadBody)](#removeCorpse(zombie.iso.objects.IsoDeadBody))
   23. [getAnimals()](#getAnimals())
   24. [getCorpses()](#getCorpses())
   25. [getCorpsesConnected()](#getCorpsesConnected())
   26. [getTroughs()](#getTroughs())
   27. [getHutchs()](#getHutchs())
   28. [getAnimalsConnected()](#getAnimalsConnected())
   29. [getTroughsConnected()](#getTroughsConnected())
   30. [getHutchsConnected()](#getHutchsConnected())
   31. [getFoodOnGround()](#getFoodOnGround())
   32. [getFoodOnGroundConnected()](#getFoodOnGroundConnected())
   33. [getNearWaterSquaresConnected()](#getNearWaterSquaresConnected())
   34. [getFullZoneSize()](#getFullZoneSize())
   35. [addNewRoof(int, int, int)](#addNewRoof(int,int,int))
   36. [getRoofAreas()](#getRoofAreas())
   37. [getRoofAreasConnected()](#getRoofAreasConnected())
   38. [Reset()](#Reset())
   39. [getNbOfDung()](#getNbOfDung())
   40. [getNbOfFeather()](#getNbOfFeather())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class DesignationZoneAnimal
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.iso.areas.DesignationZone](DesignationZone.html "class in zombie.iso.areas")

zombie.iso.areas.DesignationZoneAnimal

---

public final class DesignationZoneAnimal
extends [DesignationZone](DesignationZone.html "class in zombie.iso.areas")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<IsoAnimal>`

  `animals`

  `private final ArrayList<IsoDeadBody>`

  `corpses`

  `static final ArrayList<DesignationZoneAnimal>`

  `designationAnimalZoneList`

  `static final String`

  `FENCE_NORTH`

  `static final String`

  `FENCE_NORTHCORNER`

  `static final String`

  `FENCE_WEST`

  `final ArrayList<IsoWorldInventoryObject>`

  `foodOnGround`

  `final ArrayList<IsoHutch>`

  `hutchs`

  `private int`

  `nbOfDung`

  `private int`

  `nbOfFeather`

  `final ArrayList<IsoGridSquare>`

  `nearWaterSquares`

  `private final zombie.popman.ObjectPool<Position3D>`

  `position3dPool`

  `private final ArrayList<Position3D>`

  `roofAreas`

  `final ArrayList<IsoFeedingTrough>`

  `troughs`

  `static final float`

  `ZONE_COLOR_B`

  `static final float`

  `ZONE_COLOR_G`

  `static final float`

  `ZONE_COLOR_R`

  `static final float`

  `ZONE_SELECTED_COLOR_B`

  `static final float`

  `ZONE_SELECTED_COLOR_G`

  `static final float`

  `ZONE_SELECTED_COLOR_R`

  `static final String`

  `ZONE_TYPE`

  ### Fields inherited from class [DesignationZone](DesignationZone.html#field-summary "class in zombie.iso.areas")

  `allZones, h, hourLastSeen, id, lastActionTimestamp, lastUpdate, name, streamed, type, w, x, y, z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DesignationZoneAnimal(String name,
  int x,
  int y,
  int z,
  int x2,
  int y2,
  boolean doSync)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAnimal(IsoAnimal animal)`

  `void`

  `addCorpse(IsoDeadBody corpse)`

  `void`

  `addFoodOnGround(IsoWorldInventoryObject item)`

  `static void`

  `addItemOnGround(IsoWorldInventoryObject item,
  IsoGridSquare sq)`

  `static void`

  `addNewRoof(int x,
  int y,
  int z)`

  We gonna check if the new floor added could be a roof for our zone
  Animals tend to go under roof areas during rain, so we keep a list of them

  `void`

  `check()`

  When we create the zone we gonna check each square to add the animals, troughs etc.

  `void`

  `createSurroundingFence()`

  `void`

  `doMeta(int hours)`

  `static ArrayList<DesignationZoneAnimal>`

  `getAllDZones(ArrayList<DesignationZoneAnimal> currentList,
  DesignationZoneAnimal zone,
  DesignationZoneAnimal previousZone)`

  The animal is on one zone, but several other zones could be connected (ie.

  `static ArrayList<DesignationZoneAnimal>`

  `getAllZones()`

  `ArrayList<IsoAnimal>`

  `getAnimals()`

  Return all animals in this zone only

  `ArrayList<IsoAnimal>`

  `getAnimalsConnected()`

  Return all animals in all connected zones including this one

  `ArrayList<IsoDeadBody>`

  `getCorpses()`

  `ArrayList<IsoDeadBody>`

  `getCorpsesConnected()`

  `ArrayList<IsoWorldInventoryObject>`

  `getFoodOnGround()`

  `ArrayList<IsoWorldInventoryObject>`

  `getFoodOnGroundConnected()`

  `int`

  `getFullZoneSize()`

  `ArrayList<IsoHutch>`

  `getHutchs()`

  Return all hutches in this zone only

  `ArrayList<IsoHutch>`

  `getHutchsConnected()`

  Return all hutches in all connected zones including this one

  `int`

  `getNbOfDung()`

  `int`

  `getNbOfFeather()`

  `ArrayList<IsoGridSquare>`

  `getNearWaterSquaresConnected()`

  `ArrayList<Position3D>`

  `getRoofAreas()`

  Return all tiles with a roof in this zone only

  `ArrayList<Position3D>`

  `getRoofAreasConnected()`

  Return all tiles with a roof in all connected zones including this one

  `ArrayList<IsoFeedingTrough>`

  `getTroughs()`

  Return all troughs in this zone only

  `ArrayList<IsoFeedingTrough>`

  `getTroughsConnected()`

  Return all troughs in all connected zones including this one

  `static String`

  `getType()`

  `static DesignationZoneAnimal`

  `getZone(int x,
  int y)`

  `static DesignationZoneAnimal`

  `getZone(int x,
  int y,
  int z)`

  `static DesignationZoneAnimal`

  `getZoneById(double zoneID)`

  `static DesignationZoneAnimal`

  `getZoneF(float x,
  float y,
  float z)`

  `static boolean`

  `isItemDung(IsoWorldInventoryObject item)`

  `static boolean`

  `isItemFeather(IsoWorldInventoryObject item)`

  `static boolean`

  `isItemFood(IsoWorldInventoryObject item)`

  `private void`

  `reAttachAnimal()`

  Relink animal invalid input: '&' trough if needed

  `void`

  `removeAnimal(IsoAnimal animal)`

  `void`

  `removeCorpse(IsoDeadBody corpse)`

  `static void`

  `removeItemFromGround(IsoWorldInventoryObject item)`

  `static void`

  `removeZone(DesignationZoneAnimal zone,
  boolean doSync)`

  `static void`

  `Reset()`

  ### Methods inherited from class [DesignationZone](DesignationZone.html#method-summary "class in zombie.iso.areas")

  `addZone, getAllZonesByType, getH, getId, getName, getRandomFreeSquare, getRandomSquare, getW, getX, getY, getZ, getZoneById, getZoneByName, getZoneByNameAndType, getZoneByType, isFullyStreamed, isStillStreamed, load, loading, removeZone, removeZone, save, setName, sync, unloading, update`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### designationAnimalZoneList

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas")> designationAnimalZoneList
  + ### ZONE\_TYPE

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ZONE\_TYPE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.ZONE_TYPE)
  + ### ZONE\_COLOR\_R

    public static final float ZONE\_COLOR\_R

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.ZONE_COLOR_R)
  + ### ZONE\_COLOR\_G

    public static final float ZONE\_COLOR\_G

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.ZONE_COLOR_G)
  + ### ZONE\_COLOR\_B

    public static final float ZONE\_COLOR\_B

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.ZONE_COLOR_B)
  + ### ZONE\_SELECTED\_COLOR\_R

    public static final float ZONE\_SELECTED\_COLOR\_R

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.ZONE_SELECTED_COLOR_R)
  + ### ZONE\_SELECTED\_COLOR\_G

    public static final float ZONE\_SELECTED\_COLOR\_G

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.ZONE_SELECTED_COLOR_G)
  + ### ZONE\_SELECTED\_COLOR\_B

    public static final float ZONE\_SELECTED\_COLOR\_B

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.ZONE_SELECTED_COLOR_B)
  + ### animals

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> animals
  + ### corpses

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoDeadBody](../objects/IsoDeadBody.html "class in zombie.iso.objects")> corpses
  + ### troughs

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFeedingTrough](../objects/IsoFeedingTrough.html "class in zombie.iso.objects")> troughs
  + ### hutchs

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoHutch](../objects/IsoHutch.html "class in zombie.iso.objects")> hutchs
  + ### foodOnGround

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldInventoryObject](../objects/IsoWorldInventoryObject.html "class in zombie.iso.objects")> foodOnGround
  + ### nearWaterSquares

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> nearWaterSquares
  + ### nbOfDung

    private int nbOfDung
  + ### nbOfFeather

    private int nbOfFeather
  + ### roofAreas

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Position3D](../../characters/Position3D.html "class in zombie.characters")> roofAreas
  + ### position3dPool

    private final zombie.popman.ObjectPool<[Position3D](../../characters/Position3D.html "class in zombie.characters")> position3dPool
  + ### FENCE\_WEST

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FENCE\_WEST

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.FENCE_WEST)
  + ### FENCE\_NORTH

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FENCE\_NORTH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.FENCE_NORTH)
  + ### FENCE\_NORTHCORNER

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FENCE\_NORTHCORNER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.DesignationZoneAnimal.FENCE_NORTHCORNER)
* Constructor Details
  -------------------

  + ### DesignationZoneAnimal

    public DesignationZoneAnimal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int x,
    int y,
    int z,
    int x2,
    int y2,
    boolean doSync)
* Method Details
  --------------

  + ### getAllDZones

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas")> getAllDZones([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas")> currentList,
    [DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas") zone,
    [DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas") previousZone)

    The animal is on one zone, but several other zones could be connected (ie. other animal zone that touch the current one) and we want them all
  + ### createSurroundingFence

    public void createSurroundingFence()
  + ### isItemFood

    public static boolean isItemFood([IsoWorldInventoryObject](../objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") item)
  + ### isItemDung

    public static boolean isItemDung([IsoWorldInventoryObject](../objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") item)
  + ### isItemFeather

    public static boolean isItemFeather([IsoWorldInventoryObject](../objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") item)
  + ### addItemOnGround

    public static void addItemOnGround([IsoWorldInventoryObject](../objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") item,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### addFoodOnGround

    public void addFoodOnGround([IsoWorldInventoryObject](../objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") item)
  + ### check

    public void check()

    When we create the zone we gonna check each square to add the animals, troughs etc. in it

    Overrides:
    :   `check` in class `DesignationZone`
  + ### reAttachAnimal

    private void reAttachAnimal()

    Relink animal invalid input: '&' trough if needed
  + ### doMeta

    public void doMeta(int hours)

    Overrides:
    :   `doMeta` in class `DesignationZone`
  + ### getType

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()
  + ### getAllZones

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas")> getAllZones()
  + ### getZone

    public static [DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas") getZone(int x,
    int y,
    int z)
  + ### getZoneById

    public static [DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas") getZoneById(double zoneID)
  + ### getZoneF

    public static [DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas") getZoneF(float x,
    float y,
    float z)
  + ### getZone

    public static [DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas") getZone(int x,
    int y)
  + ### removeZone

    public static void removeZone([DesignationZoneAnimal](DesignationZoneAnimal.html "class in zombie.iso.areas") zone,
    boolean doSync)
  + ### removeItemFromGround

    public static void removeItemFromGround([IsoWorldInventoryObject](../objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") item)
  + ### addAnimal

    public void addAnimal([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### removeAnimal

    public void removeAnimal([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### addCorpse

    public void addCorpse([IsoDeadBody](../objects/IsoDeadBody.html "class in zombie.iso.objects") corpse)
  + ### removeCorpse

    public void removeCorpse([IsoDeadBody](../objects/IsoDeadBody.html "class in zombie.iso.objects") corpse)
  + ### getAnimals

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> getAnimals()

    Return all animals in this zone only
  + ### getCorpses

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoDeadBody](../objects/IsoDeadBody.html "class in zombie.iso.objects")> getCorpses()
  + ### getCorpsesConnected

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoDeadBody](../objects/IsoDeadBody.html "class in zombie.iso.objects")> getCorpsesConnected()
  + ### getTroughs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFeedingTrough](../objects/IsoFeedingTrough.html "class in zombie.iso.objects")> getTroughs()

    Return all troughs in this zone only
  + ### getHutchs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoHutch](../objects/IsoHutch.html "class in zombie.iso.objects")> getHutchs()

    Return all hutches in this zone only
  + ### getAnimalsConnected

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")> getAnimalsConnected()

    Return all animals in all connected zones including this one
  + ### getTroughsConnected

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFeedingTrough](../objects/IsoFeedingTrough.html "class in zombie.iso.objects")> getTroughsConnected()

    Return all troughs in all connected zones including this one
  + ### getHutchsConnected

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoHutch](../objects/IsoHutch.html "class in zombie.iso.objects")> getHutchsConnected()

    Return all hutches in all connected zones including this one
  + ### getFoodOnGround

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldInventoryObject](../objects/IsoWorldInventoryObject.html "class in zombie.iso.objects")> getFoodOnGround()
  + ### getFoodOnGroundConnected

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldInventoryObject](../objects/IsoWorldInventoryObject.html "class in zombie.iso.objects")> getFoodOnGroundConnected()
  + ### getNearWaterSquaresConnected

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> getNearWaterSquaresConnected()
  + ### getFullZoneSize

    public int getFullZoneSize()
  + ### addNewRoof

    public static void addNewRoof(int x,
    int y,
    int z)

    We gonna check if the new floor added could be a roof for our zone
    Animals tend to go under roof areas during rain, so we keep a list of them
  + ### getRoofAreas

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Position3D](../../characters/Position3D.html "class in zombie.characters")> getRoofAreas()

    Return all tiles with a roof in this zone only
  + ### getRoofAreasConnected

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Position3D](../../characters/Position3D.html "class in zombie.characters")> getRoofAreasConnected()

    Return all tiles with a roof in all connected zones including this one
  + ### Reset

    public static void Reset()
  + ### getNbOfDung

    public int getNbOfDung()
  + ### getNbOfFeather

    public int getNbOfFeather()