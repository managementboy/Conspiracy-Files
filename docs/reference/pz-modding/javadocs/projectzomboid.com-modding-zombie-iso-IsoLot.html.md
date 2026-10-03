[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoLot](IsoLot.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [InfoHeaders](#InfoHeaders)
   2. [InfoHeaderNames](#InfoHeaderNames)
   3. [InfoFileNames](#InfoFileNames)
   4. [InfoFileModded](#InfoFileModded)
   5. [MapFiles](#MapFiles)
   6. [pool](#pool)
   7. [maxLevel](#maxLevel)
   8. [minLevel](#minLevel)
   9. [lastUsedPath](#lastUsedPath)
   10. [wx](#wx)
   11. [wy](#wy)
   12. [offsetInData](#offsetInData)
   13. [data](#data)
   14. [in](#in)
   15. [version](#version)
   16. [info](#info)
6. [Constructor Details](#constructor-detail)
   1. [IsoLot()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Dispose()](#Dispose())
   2. [readString(BufferedRandomAccessFile)](#readString(zombie.util.BufferedRandomAccessFile))
   3. [readInt(RandomAccessFile)](#readInt(java.io.RandomAccessFile))
   4. [readShort(RandomAccessFile)](#readShort(java.io.RandomAccessFile))
   5. [put(IsoLot)](#put(zombie.iso.IsoLot))
   6. [get(MapFiles, int, int, int, int, IsoChunk)](#get(zombie.iso.MapFiles,int,int,int,int,zombie.iso.IsoChunk))
   7. [get(MapFiles, Integer, Integer, Integer, Integer, IsoChunk)](#get(zombie.iso.MapFiles,java.lang.Integer,java.lang.Integer,java.lang.Integer,java.lang.Integer,zombie.iso.IsoChunk))
   8. [loadNew(int, int, int, int, IsoChunk)](#loadNew(int,int,int,int,zombie.iso.IsoChunk))
   9. [load(MapFiles, Integer, Integer, Integer, Integer, IsoChunk)](#load(zombie.iso.MapFiles,java.lang.Integer,java.lang.Integer,java.lang.Integer,java.lang.Integer,zombie.iso.IsoChunk))
   10. [getHeader(int, int)](#getHeader(int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoLot
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoLot

---

public class IsoLot
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final gnu.trove.list.array.TIntArrayList`

  `data`

  `private RandomAccessFile`

  `in`

  `zombie.iso.LotHeader`

  `info`

  `static final HashMap<String, zombie.iso.enums.ChunkGenerationStatus>`

  `InfoFileModded`

  `static final HashMap<String,String>`

  `InfoFileNames`

  `static final ArrayList<String>`

  `InfoHeaderNames`

  `static final HashMap<String, zombie.iso.LotHeader>`

  `InfoHeaders`

  `private String`

  `lastUsedPath`

  `static final ArrayList<zombie.iso.MapFiles>`

  `MapFiles`

  `int`

  `maxLevel`

  `int`

  `minLevel`

  `final int[]`

  `offsetInData`

  `static final zombie.popman.ObjectPool<IsoLot>`

  `pool`

  `private int`

  `version`

  `int`

  `wx`

  `int`

  `wy`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoLot()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `Dispose()`

  `static IsoLot`

  `get(zombie.iso.MapFiles mapFiles,
  int cX,
  int cY,
  int wX,
  int wY,
  IsoChunk ch)`

  `static IsoLot`

  `get(zombie.iso.MapFiles mapFiles,
  Integer cX,
  Integer cY,
  Integer wX,
  Integer wY,
  IsoChunk ch)`

  `static zombie.iso.LotHeader`

  `getHeader(int cellX,
  int cellY)`

  `void`

  `load(zombie.iso.MapFiles mapFiles,
  Integer cX,
  Integer cY,
  Integer wX,
  Integer wY,
  IsoChunk ch)`

  `void`

  `loadNew(int cX,
  int cY,
  int wX,
  int wY,
  IsoChunk ch)`

  `static void`

  `put(IsoLot lot)`

  `static int`

  `readInt(RandomAccessFile in)`

  `static int`

  `readShort(RandomAccessFile in)`

  `static String`

  `readString(zombie.util.BufferedRandomAccessFile in)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### InfoHeaders

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.iso.LotHeader> InfoHeaders
  + ### InfoHeaderNames

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> InfoHeaderNames
  + ### InfoFileNames

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> InfoFileNames
  + ### InfoFileModded

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.iso.enums.ChunkGenerationStatus> InfoFileModded
  + ### MapFiles

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.MapFiles> MapFiles
  + ### pool

    public static final zombie.popman.ObjectPool<[IsoLot](IsoLot.html "class in zombie.iso")> pool
  + ### maxLevel

    public int maxLevel
  + ### minLevel

    public int minLevel
  + ### lastUsedPath

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastUsedPath
  + ### wx

    public int wx
  + ### wy

    public int wy
  + ### offsetInData

    public final int[] offsetInData
  + ### data

    public final gnu.trove.list.array.TIntArrayList data
  + ### in

    private [RandomAccessFile](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/RandomAccessFile.html "class or interface in java.io") in
  + ### version

    private int version
  + ### info

    public zombie.iso.LotHeader info
* Constructor Details
  -------------------

  + ### IsoLot

    public IsoLot()
* Method Details
  --------------

  + ### Dispose

    public static void Dispose()
  + ### readString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") readString(zombie.util.BufferedRandomAccessFile in)
    throws [EOFException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/EOFException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `EOFException`
    :   `IOException`
  + ### readInt

    public static int readInt([RandomAccessFile](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/RandomAccessFile.html "class or interface in java.io") in)
    throws [EOFException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/EOFException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `EOFException`
    :   `IOException`
  + ### readShort

    public static int readShort([RandomAccessFile](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/RandomAccessFile.html "class or interface in java.io") in)
    throws [EOFException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/EOFException.html "class or interface in java.io"),
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `EOFException`
    :   `IOException`
  + ### put

    public static void put([IsoLot](IsoLot.html "class in zombie.iso") lot)
  + ### get

    public static [IsoLot](IsoLot.html "class in zombie.iso") get(zombie.iso.MapFiles mapFiles,
    int cX,
    int cY,
    int wX,
    int wY,
    [IsoChunk](IsoChunk.html "class in zombie.iso") ch)
  + ### get

    public static [IsoLot](IsoLot.html "class in zombie.iso") get(zombie.iso.MapFiles mapFiles,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") cX,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") cY,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") wX,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") wY,
    [IsoChunk](IsoChunk.html "class in zombie.iso") ch)
  + ### loadNew

    public void loadNew(int cX,
    int cY,
    int wX,
    int wY,
    [IsoChunk](IsoChunk.html "class in zombie.iso") ch)
  + ### load

    public void load(zombie.iso.MapFiles mapFiles,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") cX,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") cY,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") wX,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") wY,
    [IsoChunk](IsoChunk.html "class in zombie.iso") ch)
  + ### getHeader

    public static zombie.iso.LotHeader getHeader(int cellX,
    int cellY)