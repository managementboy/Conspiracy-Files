[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.worldgen](package-summary.html)
2. [WorldGenUtils](WorldGenUtils.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [INSTANCE](#INSTANCE)
   2. [OFFSET](#OFFSET)
   3. [files](#files)
6. [Constructor Details](#constructor-detail)
   1. [WorldGenUtils()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [generateSeed()](#generateSeed())
   2. [getFiles(String)](#getFiles(java.lang.String))
   3. [getFilesNum()](#getFilesNum())
   4. [getFile(int)](#getFile(int))
   5. [displayTable(String)](#displayTable(java.lang.String))
   6. [displayTable(KahluaTable)](#displayTable(se.krka.kahlua.vm.KahluaTable))
   7. [displayElement(String, Object, StringBuilder, int)](#displayElement(java.lang.String,java.lang.Object,java.lang.StringBuilder,int))
   8. [canPlace(List, String)](#canPlace(java.util.List,java.lang.String))
   9. [doesFloorExit(IsoChunk, int, int, int)](#doesFloorExit(zombie.iso.IsoChunk,int,int,int))
   10. [doesFloorExit(IsoCell, int, int, int)](#doesFloorExit(zombie.iso.IsoCell,int,int,int))
   11. [methodName(StackTraceElement)](#methodName(java.lang.StackTraceElement))
   12. [methodsCall(String, int, String...)](#methodsCall(java.lang.String,int,java.lang.String...))
   13. [showTimers(String)](#showTimers(java.lang.String))
   14. [showTimersTotal(String)](#showTimersTotal(java.lang.String))
   15. [resetTimers(String)](#resetTimers(java.lang.String))
   16. [getTimerKept(String, String)](#getTimerKept(java.lang.String,java.lang.String))
   17. [getCornerOfGeneration(int)](#getCornerOfGeneration(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WorldGenUtils
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.worldgen.WorldGenUtils

---

public class WorldGenUtils
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ArrayList<String>`

  `files`

  `static final WorldGenUtils`

  `INSTANCE`

  `private static final int`

  `OFFSET`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WorldGenUtils()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canPlace(List<String> placement,
  String floorName)`

  `private void`

  `displayElement(String name,
  Object value,
  StringBuilder buffer,
  int offset)`

  `String`

  `displayTable(String tableName)`

  `String`

  `displayTable(se.krka.kahlua.vm.KahluaTable table)`

  `@Nullable IsoObject`

  `doesFloorExit(IsoCell cell,
  int tileX,
  int tileY,
  int z)`

  `@Nullable IsoObject`

  `doesFloorExit(IsoChunk chunk,
  int tileX,
  int tileY,
  int z)`

  `String`

  `generateSeed()`

  `int`

  `getCornerOfGeneration(int b)`

  `String`

  `getFile(int i)`

  `void`

  `getFiles(String basePath)`

  `int`

  `getFilesNum()`

  `void`

  `getTimerKept(String clazzStr,
  String fieldName)`

  `String`

  `methodName(StackTraceElement trace)`

  `String`

  `methodsCall(String header,
  int depth,
  String... args)`

  `void`

  `resetTimers(String clazzStr)`

  `void`

  `showTimers(String clazzStr)`

  `void`

  `showTimersTotal(String clazzStr)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### INSTANCE

    public static final [WorldGenUtils](WorldGenUtils.html "class in zombie.iso.worldgen") INSTANCE
  + ### OFFSET

    private static final int OFFSET

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.worldgen.WorldGenUtils.OFFSET)
  + ### files

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> files
* Constructor Details
  -------------------

  + ### WorldGenUtils

    private WorldGenUtils()
* Method Details
  --------------

  + ### generateSeed

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") generateSeed()
  + ### getFiles

    public void getFiles([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") basePath)
  + ### getFilesNum

    public int getFilesNum()
  + ### getFile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFile(int i)
  + ### displayTable

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayTable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tableName)
  + ### displayTable

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayTable(se.krka.kahlua.vm.KahluaTable table)
  + ### displayElement

    private void displayElement([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") value,
    [StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") buffer,
    int offset)
  + ### canPlace

    public boolean canPlace([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> placement,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") floorName)
  + ### doesFloorExit

    public @Nullable [IsoObject](../IsoObject.html "class in zombie.iso") doesFloorExit([IsoChunk](../IsoChunk.html "class in zombie.iso") chunk,
    int tileX,
    int tileY,
    int z)
  + ### doesFloorExit

    public @Nullable [IsoObject](../IsoObject.html "class in zombie.iso") doesFloorExit([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    int tileX,
    int tileY,
    int z)
  + ### methodName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") methodName([StackTraceElement](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StackTraceElement.html "class or interface in java.lang") trace)
  + ### methodsCall

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") methodsCall([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") header,
    int depth,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")... args)
  + ### showTimers

    public void showTimers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clazzStr)
  + ### showTimersTotal

    public void showTimersTotal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clazzStr)
  + ### resetTimers

    public void resetTimers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clazzStr)
  + ### getTimerKept

    public void getTimerKept([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clazzStr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fieldName)
  + ### getCornerOfGeneration

    public int getCornerOfGeneration(int b)