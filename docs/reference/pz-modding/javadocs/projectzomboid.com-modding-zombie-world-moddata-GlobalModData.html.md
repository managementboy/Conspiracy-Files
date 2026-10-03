[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.world.moddata](package-summary.html)
2. [GlobalModData](GlobalModData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [SAVE\_EXT](#SAVE_EXT)
   2. [SAVE\_FILE](#SAVE_FILE)
   3. [instance](#instance)
   4. [modData](#modData)
   5. [BLOCK\_SIZE](#BLOCK_SIZE)
   6. [lastBlockSize](#lastBlockSize)
6. [Constructor Details](#constructor-detail)
   1. [GlobalModData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [createModDataTable()](#createModDataTable())
   2. [init()](#init())
   3. [reset()](#reset())
   4. [collectTableNames(List)](#collectTableNames(java.util.List))
   5. [exists(String)](#exists(java.lang.String))
   6. [getOrCreate(String)](#getOrCreate(java.lang.String))
   7. [get(String)](#get(java.lang.String))
   8. [create()](#create())
   9. [create(String)](#create(java.lang.String))
   10. [remove(String)](#remove(java.lang.String))
   11. [add(String, KahluaTable)](#add(java.lang.String,se.krka.kahlua.vm.KahluaTable))
   12. [transmit(String)](#transmit(java.lang.String))
   13. [request(String)](#request(java.lang.String))
   14. [receiveRequest(ByteBufferReader, IConnection)](#receiveRequest(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   15. [ensureCapacity(ByteBuffer)](#ensureCapacity(java.nio.ByteBuffer))
   16. [save()](#save())
   17. [load()](#load())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class GlobalModData
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.world.moddata.GlobalModData

---

public final class GlobalModData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

This class is not exposed to lua, ModData.java which callbacks to this is exposed instead.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final int`

  `BLOCK_SIZE`

  `static GlobalModData`

  `instance`

  `private static int`

  `lastBlockSize`

  `private final Map<String, se.krka.kahlua.vm.KahluaTable>`

  `modData`

  `static final String`

  `SAVE_EXT`

  `static final String`

  `SAVE_FILE`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GlobalModData()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(String tag,
  se.krka.kahlua.vm.KahluaTable table)`

  `void`

  `collectTableNames(List<String> list)`

  `String`

  `create()`

  `se.krka.kahlua.vm.KahluaTable`

  `create(String tag)`

  `private se.krka.kahlua.vm.KahluaTable`

  `createModDataTable()`

  `private static ByteBuffer`

  `ensureCapacity(ByteBuffer bb)`

  `boolean`

  `exists(String tag)`

  `se.krka.kahlua.vm.KahluaTable`

  `get(String tag)`

  `se.krka.kahlua.vm.KahluaTable`

  `getOrCreate(String tag)`

  `void`

  `init()`

  `void`

  `load()`

  `void`

  `receiveRequest(zombie.core.network.ByteBufferReader bb,
  zombie.network.IConnection requesterConnection)`

  `se.krka.kahlua.vm.KahluaTable`

  `remove(String tag)`

  `void`

  `request(String tag)`

  `void`

  `reset()`

  `void`

  `save()`

  `void`

  `transmit(String tag)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### SAVE\_EXT

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") SAVE\_EXT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.world.moddata.GlobalModData.SAVE_EXT)
  + ### SAVE\_FILE

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") SAVE\_FILE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.world.moddata.GlobalModData.SAVE_FILE)
  + ### instance

    public static [GlobalModData](GlobalModData.html "class in zombie.world.moddata") instance
  + ### modData

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), se.krka.kahlua.vm.KahluaTable> modData
  + ### BLOCK\_SIZE

    private static final int BLOCK\_SIZE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.world.moddata.GlobalModData.BLOCK_SIZE)
  + ### lastBlockSize

    private static int lastBlockSize
* Constructor Details
  -------------------

  + ### GlobalModData

    public GlobalModData()
* Method Details
  --------------

  + ### createModDataTable

    private se.krka.kahlua.vm.KahluaTable createModDataTable()
  + ### init

    public void init()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### reset

    public void reset()
  + ### collectTableNames

    public void collectTableNames([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list)
  + ### exists

    public boolean exists([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### getOrCreate

    public se.krka.kahlua.vm.KahluaTable getOrCreate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### get

    public se.krka.kahlua.vm.KahluaTable get([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### create

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") create()
  + ### create

    public se.krka.kahlua.vm.KahluaTable create([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### remove

    public se.krka.kahlua.vm.KahluaTable remove([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### add

    public void add([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag,
    se.krka.kahlua.vm.KahluaTable table)
  + ### transmit

    public void transmit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### request

    public void request([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### receiveRequest

    public void receiveRequest(zombie.core.network.ByteBufferReader bb,
    zombie.network.IConnection requesterConnection)
  + ### ensureCapacity

    private static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") ensureCapacity([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
  + ### save

    public void save()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`