[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [AnimalTracks](AnimalTracks.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [animalType](#animalType)
   2. [addedTime](#addedTime)
   3. [trackType](#trackType)
   4. [dir](#dir)
   5. [x](#x)
   6. [y](#y)
   7. [minSkill](#minSkill)
   8. [addedToWorld](#addedToWorld)
   9. [item](#item)
6. [Constructor Details](#constructor-detail)
   1. [AnimalTracks()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addAnimalTrack(VirtualAnimal, AnimalTracksDefinitions.AnimalTracksType)](#addAnimalTrack(zombie.characters.animals.VirtualAnimal,zombie.characters.animals.AnimalTracksDefinitions.AnimalTracksType))
   2. [addAnimalTrackAtPos(VirtualAnimal, int, int, AnimalTracksDefinitions.AnimalTracksType, long)](#addAnimalTrackAtPos(zombie.characters.animals.VirtualAnimal,int,int,zombie.characters.animals.AnimalTracksDefinitions.AnimalTracksType,long))
   3. [broadcastAnimalTrackToAdminsDebug(AnimalTracks, boolean)](#broadcastAnimalTrackToAdminsDebug(zombie.characters.animals.AnimalTracks,boolean))
   4. [canFindTrack(IsoGameCharacter)](#canFindTrack(zombie.characters.IsoGameCharacter))
   5. [addTrackingExp(IsoGameCharacter, boolean)](#addTrackingExp(zombie.characters.IsoGameCharacter,boolean))
   6. [getTrackStr(String)](#getTrackStr(java.lang.String))
   7. [getAndFindNearestTracks(IsoGameCharacter)](#getAndFindNearestTracks(zombie.characters.IsoGameCharacter))
   8. [getNearestTracks(int, int, int)](#getNearestTracks(int,int,int))
   9. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   10. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   11. [getTrackType()](#getTrackType())
   12. [getTrackAge(IsoGameCharacter)](#getTrackAge(zombie.characters.IsoGameCharacter))
   13. [getDir()](#getDir())
   14. [getMinSkill()](#getMinSkill())
   15. [getTrackItem()](#getTrackItem())
   16. [getTrackSprite()](#getTrackSprite())
   17. [isAddedToWorld()](#isAddedToWorld())
   18. [setAddedToWorld(boolean)](#setAddedToWorld(boolean))
   19. [addItemToWorld()](#addItemToWorld())
   20. [getAllIsoTracks()](#getAllIsoTracks())
   21. [addToWorld()](#addToWorld())
   22. [getIsoAnimalTrack()](#getIsoAnimalTrack())
   23. [getFreshnessString(int)](#getFreshnessString(int))
   24. [getTrackAgeDays()](#getTrackAgeDays())
   25. [getTrackHours()](#getTrackHours())
   26. [isItem()](#isItem())
   27. [getSquare()](#getSquare())
   28. [getTimestamp()](#getTimestamp())
   29. [getAnimalType()](#getAnimalType())
   30. [getItem()](#getItem())
   31. [setItem(InventoryItem)](#setItem(zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AnimalTracks
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.AnimalTracks

---

public class AnimalTracks
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `long`

  `addedTime`

  `boolean`

  `addedToWorld`

  `String`

  `animalType`

  `IsoDirections`

  `dir`

  `private InventoryItem`

  `item`

  `int`

  `minSkill`

  `String`

  `trackType`

  `int`

  `x`

  `int`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalTracks()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static AnimalTracks`

  `addAnimalTrack(VirtualAnimal animal,
  zombie.characters.animals.AnimalTracksDefinitions.AnimalTracksType trackType)`

  `static AnimalTracks`

  `addAnimalTrackAtPos(VirtualAnimal animal,
  int x,
  int y,
  zombie.characters.animals.AnimalTracksDefinitions.AnimalTracksType trackType,
  long timeMinus)`

  Currently this used to only spawn some tracks when we spawn the animal in the world

  `InventoryItem`

  `addItemToWorld()`

  Add a track inventory object to the floor (added from ISAnimalTracksFinder)

  `ArrayList<IsoAnimalTrack>`

  `addToWorld()`

  Add a track tile to the world (added from ISAnimalTracksFinder)

  `void`

  `addTrackingExp(IsoGameCharacter chr,
  boolean success)`

  We can add tracking exp even if we didn't find the track

  `static void`

  `broadcastAnimalTrackToAdminsDebug(AnimalTracks track,
  boolean state)`

  `boolean`

  `canFindTrack(IsoGameCharacter chr)`

  Check if we can find this track, depending on track skill
  This is called at period in ISAnimalTracksFinder

  `ArrayList<IsoAnimalTrack>`

  `getAllIsoTracks()`

  `static ArrayList<AnimalTracks>`

  `getAndFindNearestTracks(IsoGameCharacter character)`

  `String`

  `getAnimalType()`

  `IsoDirections`

  `getDir()`

  `String`

  `getFreshnessString(int trackingLevel)`

  `IsoAnimalTrack`

  `getIsoAnimalTrack()`

  Try to get a tile from the floor (when right click to inspect it for ex.)

  `InventoryItem`

  `getItem()`

  `int`

  `getMinSkill()`

  `static ArrayList<AnimalTracks>`

  `getNearestTracks(int x,
  int y,
  int radius)`

  Check the animal cell we're in, then check each chunk for animal tracks in it

  `IsoGridSquare`

  `getSquare()`

  `String`

  `getTimestamp()`

  `String`

  `getTrackAge(IsoGameCharacter chr)`

  `int`

  `getTrackAgeDays()`

  `int`

  `getTrackHours()`

  `String`

  `getTrackItem()`

  A track can be either an inventory object that can be picked or a tile

  `String`

  `getTrackSprite()`

  A track can be either an inventory object that can be picked or a tile
  A tile can have direction to it (footstep for ex have them, while grazing area is just a simple tile)

  `static String`

  `getTrackStr(String trackType)`

  `String`

  `getTrackType()`

  `boolean`

  `isAddedToWorld()`

  `boolean`

  `isItem()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setAddedToWorld(boolean b)`

  `void`

  `setItem(InventoryItem item)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### animalType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType
  + ### addedTime

    public long addedTime
  + ### trackType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") trackType
  + ### dir

    public [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") dir
  + ### x

    public int x
  + ### y

    public int y
  + ### minSkill

    public int minSkill
  + ### addedToWorld

    public boolean addedToWorld
  + ### item

    private [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item
* Constructor Details
  -------------------

  + ### AnimalTracks

    public AnimalTracks()
* Method Details
  --------------

  + ### addAnimalTrack

    public static [AnimalTracks](AnimalTracks.html "class in zombie.characters.animals") addAnimalTrack([VirtualAnimal](VirtualAnimal.html "class in zombie.characters.animals") animal,
    zombie.characters.animals.AnimalTracksDefinitions.AnimalTracksType trackType)
  + ### addAnimalTrackAtPos

    public static [AnimalTracks](AnimalTracks.html "class in zombie.characters.animals") addAnimalTrackAtPos([VirtualAnimal](VirtualAnimal.html "class in zombie.characters.animals") animal,
    int x,
    int y,
    zombie.characters.animals.AnimalTracksDefinitions.AnimalTracksType trackType,
    long timeMinus)

    Currently this used to only spawn some tracks when we spawn the animal in the world

    Parameters:
    :   `timeMinus` - remove some times to the track to simulate it has been there for some time
  + ### broadcastAnimalTrackToAdminsDebug

    public static void broadcastAnimalTrackToAdminsDebug([AnimalTracks](AnimalTracks.html "class in zombie.characters.animals") track,
    boolean state)
  + ### canFindTrack

    public boolean canFindTrack([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr)

    Check if we can find this track, depending on track skill
    This is called at period in ISAnimalTracksFinder
  + ### addTrackingExp

    public void addTrackingExp([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr,
    boolean success)

    We can add tracking exp even if we didn't find the track
  + ### getTrackStr

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTrackStr([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") trackType)
  + ### getAndFindNearestTracks

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalTracks](AnimalTracks.html "class in zombie.characters.animals")> getAndFindNearestTracks([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") character)
  + ### getNearestTracks

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalTracks](AnimalTracks.html "class in zombie.characters.animals")> getNearestTracks(int x,
    int y,
    int radius)

    Check the animal cell we're in, then check each chunk for animal tracks in it

    Parameters:
    :   `x` - pos of the player
    :   `y` - pos of the player
    :   `radius` - this is increased with tracking perk level
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getTrackType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTrackType()
  + ### getTrackAge

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTrackAge([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getDir

    public [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") getDir()
  + ### getMinSkill

    public int getMinSkill()
  + ### getTrackItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTrackItem()

    A track can be either an inventory object that can be picked or a tile

    Returns:
    :   full type of the item (defined in TracksDefinitions.lua)
  + ### getTrackSprite

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTrackSprite()

    A track can be either an inventory object that can be picked or a tile
    A tile can have direction to it (footstep for ex have them, while grazing area is just a simple tile)

    Returns:
    :   name of the tile (defined in TracksDefinitions.lua)
  + ### isAddedToWorld

    public boolean isAddedToWorld()
  + ### setAddedToWorld

    public void setAddedToWorld(boolean b)
  + ### addItemToWorld

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") addItemToWorld()

    Add a track inventory object to the floor (added from ISAnimalTracksFinder)
  + ### getAllIsoTracks

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimalTrack](../../iso/objects/IsoAnimalTrack.html "class in zombie.iso.objects")> getAllIsoTracks()
  + ### addToWorld

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimalTrack](../../iso/objects/IsoAnimalTrack.html "class in zombie.iso.objects")> addToWorld()

    Add a track tile to the world (added from ISAnimalTracksFinder)
  + ### getIsoAnimalTrack

    public [IsoAnimalTrack](../../iso/objects/IsoAnimalTrack.html "class in zombie.iso.objects") getIsoAnimalTrack()

    Try to get a tile from the floor (when right click to inspect it for ex.)
  + ### getFreshnessString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFreshnessString(int trackingLevel)
  + ### getTrackAgeDays

    public int getTrackAgeDays()
  + ### getTrackHours

    public int getTrackHours()
  + ### isItem

    public boolean isItem()
  + ### getSquare

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getSquare()
  + ### getTimestamp

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTimestamp()
  + ### getAnimalType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalType()
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem()
  + ### setItem

    public void setItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)