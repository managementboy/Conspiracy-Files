[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [AnimalChunk](AnimalChunk.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [animals](#animals)
   4. [cell](#cell)
   5. [animalTracks](#animalTracks)
   6. [tracksUpdateTimer](#tracksUpdateTimer)
   7. [pool](#pool)
6. [Constructor Details](#constructor-detail)
   1. [AnimalChunk()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(int, int)](#init(int,int))
   2. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   3. [updateTracks()](#updateTracks())
   4. [save(ByteBuffer, ArrayList)](#save(java.nio.ByteBuffer,java.util.ArrayList))
   5. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   6. [getVirtualAnimals()](#getVirtualAnimals())
   7. [getAnimalsTracks()](#getAnimalsTracks())
   8. [deleteTracks()](#deleteTracks())
   9. [addTracksStr(VirtualAnimal, String)](#addTracksStr(zombie.characters.animals.VirtualAnimal,java.lang.String))
   10. [addTracks(VirtualAnimal, AnimalTracksDefinitions.AnimalTracksType)](#addTracks(zombie.characters.animals.VirtualAnimal,zombie.characters.animals.AnimalTracksDefinitions.AnimalTracksType))
   11. [findAnimalByID(double)](#findAnimalByID(double))
   12. [alloc()](#alloc())
   13. [isEmpty()](#isEmpty())
   14. [saveEmpty(ByteBuffer)](#saveEmpty(java.nio.ByteBuffer))
   15. [release()](#release())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AnimalChunk
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.AnimalChunk

---

public final class AnimalChunk
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final ArrayList<VirtualAnimal>`

  `animals`

  `final ArrayList<AnimalTracks>`

  `animalTracks`

  `zombie.characters.animals.AnimalCell`

  `cell`

  `(package private) static final zombie.popman.ObjectPool<AnimalChunk>`

  `pool`

  `(package private) float`

  `tracksUpdateTimer`

  `(package private) int`

  `x`

  `(package private) int`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalChunk()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addTracks(VirtualAnimal animal,
  zombie.characters.animals.AnimalTracksDefinitions.AnimalTracksType trackType)`

  `void`

  `addTracksStr(VirtualAnimal animal,
  String trackType)`

  `(package private) static AnimalChunk`

  `alloc()`

  `void`

  `deleteTracks()`

  `VirtualAnimal`

  `findAnimalByID(double id)`

  `ArrayList<AnimalTracks>`

  `getAnimalsTracks()`

  `ArrayList<VirtualAnimal>`

  `getVirtualAnimals()`

  `(package private) AnimalChunk`

  `init(int x,
  int y)`

  `(package private) boolean`

  `isEmpty()`

  `(package private) void`

  `load(ByteBuffer input,
  int worldVersion)`

  `(package private) void`

  `release()`

  `(package private) void`

  `save(ByteBuffer output)`

  `(package private) void`

  `save(ByteBuffer output,
  ArrayList<VirtualAnimal> realAnimals)`

  `(package private) static void`

  `saveEmpty(ByteBuffer output)`

  `void`

  `updateTracks()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    int x
  + ### y

    int y
  + ### animals

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VirtualAnimal](VirtualAnimal.html "class in zombie.characters.animals")> animals
  + ### cell

    public zombie.characters.animals.AnimalCell cell
  + ### animalTracks

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalTracks](AnimalTracks.html "class in zombie.characters.animals")> animalTracks
  + ### tracksUpdateTimer

    float tracksUpdateTimer
  + ### pool

    static final zombie.popman.ObjectPool<[AnimalChunk](AnimalChunk.html "class in zombie.characters.animals")> pool
* Constructor Details
  -------------------

  + ### AnimalChunk

    public AnimalChunk()
* Method Details
  --------------

  + ### init

    [AnimalChunk](AnimalChunk.html "class in zombie.characters.animals") init(int x,
    int y)
  + ### save

    void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### updateTracks

    public void updateTracks()
  + ### save

    void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VirtualAnimal](VirtualAnimal.html "class in zombie.characters.animals")> realAnimals)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getVirtualAnimals

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VirtualAnimal](VirtualAnimal.html "class in zombie.characters.animals")> getVirtualAnimals()
  + ### getAnimalsTracks

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimalTracks](AnimalTracks.html "class in zombie.characters.animals")> getAnimalsTracks()
  + ### deleteTracks

    public void deleteTracks()
  + ### addTracksStr

    public void addTracksStr([VirtualAnimal](VirtualAnimal.html "class in zombie.characters.animals") animal,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") trackType)
  + ### addTracks

    public void addTracks([VirtualAnimal](VirtualAnimal.html "class in zombie.characters.animals") animal,
    zombie.characters.animals.AnimalTracksDefinitions.AnimalTracksType trackType)
  + ### findAnimalByID

    public [VirtualAnimal](VirtualAnimal.html "class in zombie.characters.animals") findAnimalByID(double id)
  + ### alloc

    static [AnimalChunk](AnimalChunk.html "class in zombie.characters.animals") alloc()
  + ### isEmpty

    boolean isEmpty()
  + ### saveEmpty

    static void saveEmpty([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### release

    void release()