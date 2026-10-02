[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.worldgen](package-summary.html)
2. [WorldGenParams](WorldGenParams.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [FILE\_MAGIC](#FILE_MAGIC)
   2. [INSTANCE](#INSTANCE)
   3. [GENERATION\_SIZE](#GENERATION_SIZE)
   4. [GENERATION\_SQUARES](#GENERATION_SQUARES)
   5. [seedString](#seedString)
   6. [seed](#seed)
   7. [minXCell](#minXCell)
   8. [minYCell](#minYCell)
   9. [maxXCell](#maxXCell)
   10. [maxYCell](#maxYCell)
7. [Constructor Details](#constructor-detail)
   1. [WorldGenParams()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getSeedString()](#getSeedString())
   2. [setSeedString(String)](#setSeedString(java.lang.String))
   3. [getSeed()](#getSeed())
   4. [getRandom(int, int)](#getRandom(int,int))
   5. [getRandom(int, int, long)](#getRandom(int,int,long))
   6. [getMinXCell()](#getMinXCell())
   7. [setMinXCell(int)](#setMinXCell(int))
   8. [getMinYCell()](#getMinYCell())
   9. [setMinYCell(int)](#setMinYCell(int))
   10. [getMaxXCell()](#getMaxXCell())
   11. [setMaxXCell(int)](#setMaxXCell(int))
   12. [getMaxYCell()](#getMaxYCell())
   13. [setMaxYCell(int)](#setMaxYCell(int))
   14. [save()](#save())
   15. [load()](#load())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WorldGenParams
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.worldgen.WorldGenParams

---

public class WorldGenParams
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `WorldGenParams.Result`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final byte[]`

  `FILE_MAGIC`

  `static final int`

  `GENERATION_SIZE`

  `static final int`

  `GENERATION_SQUARES`

  `static final WorldGenParams`

  `INSTANCE`

  `private int`

  `maxXCell`

  `private int`

  `maxYCell`

  `private int`

  `minXCell`

  `private int`

  `minYCell`

  `private int`

  `seed`

  `private String`

  `seedString`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WorldGenParams()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getMaxXCell()`

  `int`

  `getMaxYCell()`

  `int`

  `getMinXCell()`

  `int`

  `getMinYCell()`

  `Random`

  `getRandom(int wx,
  int wy)`

  `Random`

  `getRandom(int wx,
  int wy,
  long offset)`

  `long`

  `getSeed()`

  `String`

  `getSeedString()`

  `WorldGenParams.Result`

  `load()`

  `void`

  `save()`

  `void`

  `setMaxXCell(int maxXCell)`

  `void`

  `setMaxYCell(int maxYCell)`

  `void`

  `setMinXCell(int minXCell)`

  `void`

  `setMinYCell(int minYCell)`

  `void`

  `setSeedString(String seedString)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### FILE\_MAGIC

    private static final byte[] FILE\_MAGIC
  + ### INSTANCE

    public static final [WorldGenParams](WorldGenParams.html "class in zombie.iso.worldgen") INSTANCE
  + ### GENERATION\_SIZE

    public static final int GENERATION\_SIZE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.worldgen.WorldGenParams.GENERATION_SIZE)
  + ### GENERATION\_SQUARES

    public static final int GENERATION\_SQUARES

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.worldgen.WorldGenParams.GENERATION_SQUARES)
  + ### seedString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") seedString
  + ### seed

    private int seed
  + ### minXCell

    private int minXCell
  + ### minYCell

    private int minYCell
  + ### maxXCell

    private int maxXCell
  + ### maxYCell

    private int maxYCell
* Constructor Details
  -------------------

  + ### WorldGenParams

    private WorldGenParams()
* Method Details
  --------------

  + ### getSeedString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSeedString()
  + ### setSeedString

    public void setSeedString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") seedString)
  + ### getSeed

    public long getSeed()
  + ### getRandom

    public [Random](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Random.html "class or interface in java.util") getRandom(int wx,
    int wy)
  + ### getRandom

    public [Random](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Random.html "class or interface in java.util") getRandom(int wx,
    int wy,
    long offset)
  + ### getMinXCell

    public int getMinXCell()
  + ### setMinXCell

    public void setMinXCell(int minXCell)
  + ### getMinYCell

    public int getMinYCell()
  + ### setMinYCell

    public void setMinYCell(int minYCell)
  + ### getMaxXCell

    public int getMaxXCell()
  + ### setMaxXCell

    public void setMaxXCell(int maxXCell)
  + ### getMaxYCell

    public int getMaxYCell()
  + ### setMaxYCell

    public void setMaxYCell(int maxYCell)
  + ### save

    public void save()
  + ### load

    public [WorldGenParams.Result](WorldGenParams.Result.html "enum class in zombie.iso.worldgen") load()